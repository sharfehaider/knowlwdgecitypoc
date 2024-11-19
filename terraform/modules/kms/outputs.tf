output "kms_key_arn" {
  description = "KMS Key ARN for encryption"
  value       = aws_kms_key.kms_key.arn
}
