variable "name" {
  description = "S3 bucket or logging resource name"
  type        = string
}

variable "environment" {
  description = "Environment (prod/dev/etc.)"
  type        = string
  default     = "prod"
}

variable "log_retention_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
