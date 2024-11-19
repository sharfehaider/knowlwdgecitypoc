variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  description = "Version of Kubernetes for EKS"
  default     = "1.27"
}

variable "vpc_id" {
  description = "VPC ID where EKS will be deployed"
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS worker nodes"
  type        = list(string)
}

variable "node_min_size" {
  description = "Minimum number of nodes in the managed node group"
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of nodes in the managed node group"
  default     = 5
}

variable "node_desired_capacity" {
  description = "Desired number of nodes in the managed node group"
  default     = 3
}

variable "node_instance_type" {
  description = "Instance type for EKS nodes"
  default     = "t3.medium"
}
