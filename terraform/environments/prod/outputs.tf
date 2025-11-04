output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "jenkins_public_ip" {
  value = module.ec2_jenkins.public_ip
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "rds_endpoint" {
  value = try(module.rds.endpoint, "")
}

output "backup_vault" {
  value = try(module.backup.vault_arn, "")
}

# EKS outputs: may be empty when enable_eks = false
output "eks_cluster_name" {
  value = try(module.eks.cluster_name, "")
}
output "eks_cluster_id" {
  value = try(module.eks.cluster_id, "")
}
