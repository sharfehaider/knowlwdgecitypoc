# IAM Role for EC2 Instances (Frontend, API, and Media Servers)
resource "aws_iam_role" "ec2_instance_role" {
  name = "${var.name_prefix}-ec2-instance-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.name_prefix}-ec2-instance-role"
  }
}

# IAM Policy for EC2 Role
resource "aws_iam_policy" "ec2_instance_policy" {
  name        = "${var.name_prefix}-ec2-instance-policy"
  description = "IAM policy for EC2 instances to access required AWS services"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.react_s3_bucket_name}",
          "arn:aws:s3:::${var.react_s3_bucket_name}/*",
          "arn:aws:s3:::${var.svelte_s3_bucket_name}",
          "arn:aws:s3:::${var.svelte_s3_bucket_name}/*"
        ]
      },
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = "${var.name_prefix}-ec2-instance-policy"
  }
}

# Attach Policy to EC2 Role
resource "aws_iam_role_policy_attachment" "ec2_role_policy_attachment" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = aws_iam_policy.ec2_instance_policy.arn
}

# IAM Role for EKS Cluster
resource "aws_iam_role" "eks_role" {
  name = "${var.name_prefix}-eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.name_prefix}-eks-role"
  }
}

# IAM Policy for EKS Role
resource "aws_iam_policy" "eks_policy" {
  name        = "${var.name_prefix}-eks-policy"
  description = "IAM policy for EKS cluster to manage resources"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ec2:DescribeInstances",
          "ec2:DescribeSubnets",
          "ec2:DescribeSecurityGroups",
          "elasticloadbalancing:*",
          "autoscaling:*",
          "eks:*"
        ]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = "${var.name_prefix}-eks-policy"
  }
}

# Attach Policy to EKS Role
resource "aws_iam_role_policy_attachment" "eks_role_policy_attachment" {
  role       = aws_iam_role.eks_role.name
  policy_arn = aws_iam_policy.eks_policy.arn
}

# IAM Role for RDS Access
resource "aws_iam_role" "rds_role" {
  name = "${var.name_prefix}-rds-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "rds.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.name_prefix}-rds-role"
  }
}

# IAM Policy for RDS Role
resource "aws_iam_policy" "rds_policy" {
  name        = "${var.name_prefix}-rds-policy"
  description = "IAM policy for RDS to access resources"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = "${var.name_prefix}-rds-policy"
  }
}

# Attach Policy to RDS Role
resource "aws_iam_role_policy_attachment" "rds_role_policy_attachment" {
  role       = aws_iam_role.rds_role.name
  policy_arn = aws_iam_policy.rds_policy.arn
}


resource "aws_kms_key" "kms_key" {
  description         = "KMS key for encryption"
  enable_key_rotation = true
  tags = {
    Name = "${var.name_prefix}-kms-key"
  }
}