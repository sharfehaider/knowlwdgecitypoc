output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.distribution.id
}

output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.distribution.domain_name
}

output "cloudfront_origin_access_identity_id" {
  description = "CloudFront Origin Access Identity ID"
  value       = aws_cloudfront_origin_access_identity.oai.id
}
