variable "db_identifier" {
  description = "RDS instance identifier"
  type        = string
  default     = "nti-rds"
}

variable "engine" {
  description = "RDS engine type"
  type        = string
  default     = "postgres"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
  default     = 20
}

variable "username" {
  description = "RDS admin username"
  type        = string
  default     = "nti_admin"
}

variable "db_subnet_ids" {
  description = "List of private subnets for RDS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where RDS will be deployed"
  type        = string
}

variable "rds_sg_id" {
  description = "Security group ID for RDS (create externally if needed)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for RDS resources"
  type        = map(string)
  default     = {}
}
