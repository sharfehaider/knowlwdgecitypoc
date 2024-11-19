module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.29.0"  # Ensure this version supports node groups

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  # Managed Node Groups
  eks_managed_node_groups = {
    managed_node_group = {
      min_size       = var.node_min_size
      max_size       = var.node_max_size
      desired_size   = var.node_desired_capacity
      instance_types = [var.node_instance_type]
      ami_type       = "AL2_x86_64"  # Amazon Linux 2
    }
  }

  tags = {
    Name = var.cluster_name
  }
}
