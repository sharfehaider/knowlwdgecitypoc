variable "s3_bucket_name" {
  description = "Name of the S3 bucket to use as CloudFront origin"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate to enable HTTPS on CloudFront"
  type        = string
}



variable "s3_bucket_domain_name" {
  description = "The domain name of the S3 bucket to be used as the origin for CloudFront"
  type        = string
}
