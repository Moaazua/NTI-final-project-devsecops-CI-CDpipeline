variable "aws_region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "eks_cluster_name" {
  type = string
  default = "nti-eks"
}

variable "eks_version" {
  type = string
  default = "1.27"
}

variable "eks_node_instance_type" {
  type = string
  default = "t3.small"
}

variable "eks_node_min" {
  type = number
  default = 0
}

variable "eks_node_desired" {
  type = number
  default = 1
}

variable "eks_node_max" {
  type = number
  default = 2
}

variable "jenkins_key_name" {
  type = string
  default = ""
}

variable "common_tags" {
  type = map(string)
  default = {
    Project = "NTI-DevSecOps"
    Owner   = "Moaz"
  }
}
