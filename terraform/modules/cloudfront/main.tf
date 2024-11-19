resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for CloudFront to access S3 bucket ${var.s3_bucket_name}"
}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = var.s3_bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontAccess"
        Effect    = "Allow"
        Principal = {
          CanonicalUser = aws_cloudfront_origin_access_identity.oai.s3_canonical_user_id
        }
        Action   = ["s3:GetObject"]
        Resource = "${var.s3_bucket_name}/*"
      }
    ]
  })
}

resource "aws_cloudfront_distribution" "distribution" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    origin_id   = "${var.s3_bucket_name}-origin"
    domain_name =  var.s3_bucket_domain_name
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    target_origin_id       = "${var.s3_bucket_name}-origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "${var.s3_bucket_name}-cloudfront"
  }
}
