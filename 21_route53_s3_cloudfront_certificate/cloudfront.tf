resource "aws_cloudfront_origin_access_identity" "demo_origin_access_identity" {
  comment = "OAI for demo.jaypatel.link"
}


resource "aws_cloudfront_distribution" "demo_distribution" {
  origin {
    domain_name = aws_s3_bucket.demo.bucket_regional_domain_name
    origin_id   = "S3-demo"

     s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.demo_origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for demo.jaypatel.link"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-demo"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.demo_certificate.arn
    ssl_support_method  = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "demo.jaypatel.link CloudFront Distribution"
  }
}
