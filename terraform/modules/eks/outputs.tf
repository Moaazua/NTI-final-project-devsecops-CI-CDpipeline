output "eks_cluster_id" {
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value       = module.eks.cluster_endpoint
}

output "eks_node_group_names" {
  value       = [for ng in module.eks.node_groups : ng.value.node_group_name]
}
