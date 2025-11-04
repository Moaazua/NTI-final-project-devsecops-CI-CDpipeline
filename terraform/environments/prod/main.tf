# --------------------
# VPC
# --------------------
module "vpc" {
  source = "../../modules/vpc"
  name   = var.project_name
  cidr   = var.vpc_cidr
  azs    = var.azs

  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  enable_nat_gateway = var.enable_nat_gateway
  tags               = var.common_tags
}

# --------------------
# S3
# --------------------
module "s3" {
  source             = "../../modules/s3"
  name               = "${var.project_name}-s3"
  environment        = var.environment
  log_retention_days = var.s3_log_retention_days
  tags               = var.common_tags
}

# --------------------
# ECR
# --------------------
module "ecr" {
  source = "../../modules/ecr"
  name   = var.ecr_repo_name
  tags   = var.common_tags
}

# --------------------
# EC2 Jenkins
# --------------------
module "ec2_jenkins" {
  source           = "../../modules/ec2-jenkins"
  name             = "${var.project_name}-jenkins"
  key_name         = var.jenkins_key_name
  instance_type    = var.jenkins_instance_type
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = element(module.vpc.public_subnet_ids, 0)
  root_volume_size = var.root_volume_size
  tags             = var.common_tags
}

# --------------------
# RDS
# --------------------
module "rds" {
  source            = "../../modules/rds"
  db_identifier     = "${var.project_name}-rds"
  engine            = var.rds_engine
  instance_class    = var.rds_instance_class
  allocated_storage = var.rds_allocated_storage
  username          = var.rds_username
  db_subnet_ids     = module.vpc.private_subnet_ids
  vpc_id            = module.vpc.vpc_id
  rds_sg_id         = var.rds_sg_id
  tags              = var.common_tags
}

# --------------------
# Backup (Jenkins EC2 snapshot)
# --------------------
module "backup" {
  source           = "../../modules/backup"
  vault_name       = var.backup_vault_name
  enabled          = var.enable_backup
  ec2_resource_arn = module.ec2_jenkins.instance_arn
  retention_days   = var.backup_retention_days
  tags             = var.common_tags
}

# --------------------
# EKS Cluster
# --------------------
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnet_ids

  tags = var.common_tags

 
}
