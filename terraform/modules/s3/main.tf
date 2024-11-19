resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = merge(
    {
      Name        = var.bucket_name
      Environment = var.environment
    },
    var.additional_tags
  )
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.encryption_algorithm
      kms_master_key_id = var.kms_key_id
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = var.policy_json
}
