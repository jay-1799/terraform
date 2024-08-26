output "cloudfront_url" {
  value = aws_cloudfront_distribution.demo_distribution.domain_name
}