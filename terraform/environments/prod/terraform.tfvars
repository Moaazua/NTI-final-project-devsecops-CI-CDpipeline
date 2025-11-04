# ==================================================
# Environment / AWS
# ==================================================
aws_region      = "eu-west-1"
aws_profile     = ""
project_name    = "nti-devsecops"
environment     = "prod"

# ==================================================
# VPC
# ==================================================
vpc_cidr        = "10.0.0.0/16"
azs             = ["eu-west-1a", "eu-west-1b"]
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]
enable_nat_gateway = false

# ==================================================
# Jenkins EC2
# ==================================================
jenkins_instance_type = "t3.micro"
jenkins_key_name      = ""       # ضع اسم الـ key إذا عندك
root_volume_size      = 8

# ==================================================
# RDS
# ==================================================
rds_instance_class    = "db.t3.micro"
rds_allocated_storage = 20
rds_engine            = "postgres"
rds_username          = "nti_admin"
rds_sg_id             = ""       # اختياري

# ==================================================
# ECR
# ==================================================
ecr_repo_name         = "nti-app"

# ==================================================
# S3
# ==================================================
s3_log_retention_days = 30

# ==================================================
# EKS
# ==================================================
enable_eks            = true
eks_cluster_name       = "nti-eks"
eks_version            = "1.27"
eks_node_instance_type = "t3.small"
eks_node_min           = 1
eks_node_desired       = 1
eks_node_max           = 2


# ==================================================
# Backup
# ==================================================
enable_backup          = true
backup_vault_name      = "nti-backup-vault"
backup_retention_days  = 14

# ==================================================
# Tags
# ==================================================
common_tags = {
  Project = "NTI-DevSecOps"
  Owner   = "Moaz"
}
