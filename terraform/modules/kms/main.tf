resource "aws_kms_key" "key" {
  description             = var.kms_description
  enable_key_rotation     = true
  deletion_window_in_days = 30
  tags = {
    Name = var.kms_key_alias
  }
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.kms_key_alias}"
  target_key_id = aws_kms_key.key.id
}

output "kms_key_id" {
  value = aws_kms_key.key.id
}

output "kms_key_arn" {
  value = aws_kms_key.key.arn
}

resource "aws_kms_key" "kms_key" {
  description = "KMS Key for RDS and other encryption needs"
  enable_key_rotation = true
  tags = {
    Name = "${var.name_prefix}-kms-key"
  }
}

