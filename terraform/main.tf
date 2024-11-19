provider "aws" {
  region = var.aws_region
}

# VPC Module
module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = var.vpc_cidr
  azs         = var.availability_zones
  #name_prefix = var.project_name
}

# IAM Module
module "iam" {
  source = "./modules/iam"

  name_prefix          = var.project_name
  react_s3_bucket_name = var.react_s3_bucket_name
  svelte_s3_bucket_name = var.svelte_s3_bucket_name
}


module "cloudfront_react" {
  source                 = "./modules/cloudfront"
  s3_bucket_name = var.s3_bucket_name
  s3_bucket_domain_name  = module.react_s3.bucket_domain_name
  acm_certificate_arn    = var.acm_certificate_arn
}

module "cloudfront_svelte" {
  source                 = "./modules/cloudfront"
  s3_bucket_name = var.s3_bucket_name

  s3_bucket_domain_name  = module.svelte_s3.bucket_domain_name
  acm_certificate_arn    = var.acm_certificate_arn
}


# S3 Buckets
module "react_s3" {
  source      = "./modules/s3"
  bucket_name = var.react_s3_bucket_name
}

module "svelte_s3" {
  source      = "./modules/s3"
  bucket_name = var.svelte_s3_bucket_name
}

# EC2 Frontend Instances
module "frontend_react" {
  source              = "./modules/ec2_frontend"
  name_prefix         = "${var.project_name}-react"
  ami_id              = var.react_ami_id
  instance_type       = var.instance_type
  subnets             = [module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  security_group_ids  = [module.vpc.default_sg]
  #autoscaling_enabled = true
}

module "frontend_svelte" {
  source              = "./modules/ec2_frontend"
  name_prefix         = "${var.project_name}-svelte"
  ami_id              = var.svelte_ami_id
  instance_type       = var.instance_type
  subnets             = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  security_group_ids  = [module.vpc.default_sg]
  #autoscaling_enabled = true
}

# Monolithic API on EC2
module "monolith_api" {
  source              = "./modules/ec2_monolith_api"
  name_prefix         = "${var.project_name}-api"
  ami_id              = var.monolith_api_ami_id
  instance_type       = var.instance_type
  subnets             = module.vpc.private_subnets
  security_group_ids  = [module.vpc.default_sg]
  #autoscaling_enabled = true
}

# EKS Cluster for Microservices
module "eks" {
  source              = "./modules/eks" # Your local path to the module
  cluster_name        = "${var.project_name}-eks"
  cluster_version     = var.cluster_version
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.private_subnets

}


# Media Servers
module "media_servers" {
  source              = "./modules/media_servers"
  name_prefix         = "${var.project_name}-media"
  ami_id              = var.media_server_ami_id
  instance_type       = var.media_server_instance_type
  subnets             = module.vpc.private_subnets
  security_group_ids  = [module.vpc.default_sg]
}


# Multi-AZ RDS Cluster
module "rds" {
  source              = "./modules/rds"
  name_prefix         = var.project_name
  private_subnets     = module.vpc.private_subnets
  availability_zones  = var.availability_zones
  engine              = "aurora-mysql"
  engine_version      = "5.7.mysql_aurora.2.10.0"
  db_name             = var.rds_db_name
  master_username     = var.db_username
  master_password     = var.db_password
  instance_count      = 2
  instance_class      = "db.t3.medium"
  kms_key_id          = module.iam.kms_key_arn
}

module "alb" {
  source          = "./modules/alb"
  alb_name        = "${var.project_name}-alb"
  subnets         = module.vpc.public_subnets # Pass the correct subnets
  security_groups = [module.vpc.default_sg]
}
