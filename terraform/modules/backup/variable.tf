variable "vault_name" {
  description = "Name of the backup vault"
  type        = string
  default     = "nti-backup-vault"
}

variable "enabled" {
  description = "Enable this module or not"
  type        = bool
  default     = true
}

variable "ec2_resource_arn" {
  description = "ARN of EC2 instance to backup"
  type        = string
  default     = ""
}

variable "retention_days" {
  description = "Retention period for backups in days"
  type        = number
  default     = 14
}

variable "tags" {
  description = "Tags for AWS resources"
  type        = map(string)
  default     = {}
}
