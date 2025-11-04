variable "project_name" {
  type    = string
  default = "nti-devsecops"
}

variable "environment" {
  type    = string
  default = "prod"
}

variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "aws_profile" {
  type    = string
  default = ""
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["eu-west-1a","eu-west-1b"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "enable_nat_gateway" {
  type    = bool
  default = false
}

variable "jenkins_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "jenkins_key_name" {
  type    = string
  default = ""
}

variable "root_volume_size" {
  type    = number
  default = 8
}

variable "rds_engine" {
  type    = string
  default = "postgres"
}

variable "rds_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "rds_allocated_storage" {
  type    = number
  default = 20
}

variable "rds_username" {
  type    = string
  default = "nti_admin"
}

variable "rds_sg_id" {
  type    = string
  default = ""
}

variable "ecr_repo_name" {
  type    = string
  default = "nti-app"
}

variable "s3_log_retention_days" {
  type    = number
  default = 30
}

variable "enable_eks" {
  type    = bool
  default = true
}

variable "eks_cluster_name" {
  type    = string
  default = "nti-eks"
}

variable "eks_version" {
  type    = string
  default = "1.27"
}

variable "eks_node_instance_type" {
  type    = string
  default = "t3.small"
}

variable "eks_node_min" {
  type    = number
  default = 0
}

variable "eks_node_desired" {
  type    = number
  default = 1
}

variable "eks_node_max" {
  type    = number
  default = 2
}

variable "enable_backup" {
  type    = bool
  default = true
}

variable "backup_vault_name" {
  type    = string
  default = "nti-backup-vault"
}

variable "backup_retention_days" {
  type    = number
  default = 14
}

variable "common_tags" {
  type = map(string)
  default = {
    Project = "NTI-DevSecOps"
    Owner   = "Moaz"
  }
}
