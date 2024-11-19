output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = module.eks.cluster_arn
}

output "eks_node_group_arns" {
  description = "ARNs of the EKS node groups"
  value       = try(module.eks.eks_managed_node_group_arns, [])
}

output "eks_node_group_names" {
  description = "Names of the EKS node groups"
  value       = try(module.eks.eks_managed_node_group_names, [])
}
