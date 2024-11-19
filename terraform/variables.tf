variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
}

variable "project_name" {
  description = "Prefix for resource names"
}

variable "react_s3_bucket_name" {
  description = "S3 bucket name for the React frontend"
}

variable "svelte_s3_bucket_name" {
  description = "S3 bucket name for the Svelte frontend"
}


variable "ecs_cluster_name" {
  description = "ECS Cluster name"
}

variable "rds_db_name" {
  description = "Name of the RDS database"
}

variable "rds_instance_class" {
  description = "Instance class for RDS"
}

variable "rds_allocated_storage" {
  description = "Storage size for RDS"
  default     = 20
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2 instances"
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t2.micro"
}

variable "media_server_ami_id" {
  description = "AMI ID for the media servers"
}

variable "media_server_instance_type" {
  description = "Instance type for the media servers"
  default     = "t3.medium"
}



# ACM Certificate ARN
variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS"
  type        = string
}

# React Frontend AMI ID
variable "react_ami_id" {
  description = "AMI ID for the React frontend"
  type        = string
}

# Svelte Frontend AMI ID
variable "svelte_ami_id" {
  description = "AMI ID for the Svelte frontend"
  type        = string
}

# Monolith API AMI ID
variable "monolith_api_ami_id" {
  description = "AMI ID for the monolith API"
  type        = string
}

# EC2 Instance Type
variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t3.medium"
}


variable "db_username" {
  description = "Master username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS database"
  type        = string
}












variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  default     = "1.27"
}

variable "node_min_size" {
  description = "Minimum number of EKS worker nodes"
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of EKS worker nodes"
  default     = 5
}

variable "node_desired_capacity" {
  description = "Desired number of EKS worker nodes"
  default     = 3
}

variable "node_instance_type" {
  description = "Instance type for EKS worker nodes"
  default     = "t3.medium"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  default     = "dev"
}



