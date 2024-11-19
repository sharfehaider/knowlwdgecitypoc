output "ec2_instance_role_arn" {
  description = "IAM Role ARN for EC2 instances"
  value       = aws_iam_role.ec2_instance_role.arn
}

output "eks_role_arn" {
  description = "IAM Role ARN for EKS cluster"
  value       = aws_iam_role.eks_role.arn
}

output "rds_role_arn" {
  description = "IAM Role ARN for RDS"
  value       = aws_iam_role.rds_role.arn
}

output "ec2_instance_policy_arn" {
  description = "IAM Policy ARN for EC2 instances"
  value       = aws_iam_policy.ec2_instance_policy.arn
}

output "eks_policy_arn" {
  description = "IAM Policy ARN for EKS"
  value       = aws_iam_policy.eks_policy.arn
}

output "rds_policy_arn" {
  description = "IAM Policy ARN for RDS"
  value       = aws_iam_policy.rds_policy.arn
}
output "kms_key_arn" {
  description = "KMS Key ARN for encryption"
  value       = aws_kms_key.kms_key.arn
}

