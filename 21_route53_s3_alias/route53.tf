resource "aws_route53_zone" "jaypatel_link" {
    name = var.zone_name
    provider = aws
}
# resource "aws_route53_record" "demorecord" {
#     zone_id = aws_route53_zone.jaypatel_link.id
#     name = "demo.jaypatel.link"
#     type = "A"
#     alias {
#     name                   = aws_s3_bucket.demo.website_endpoint
#     zone_id                = aws_s3_bucket.demo.hosted_zone_id # This is a fixed value for the S3 website endpoint; you need to check the hosted zone ID
#     evaluate_target_health = false
#   }
#     ttl = "300"
# }

resource "aws_route53_record" "demorecord" {
  zone_id = aws_route53_zone.jaypatel_link.zone_id # Ensure you're using the correct hosted zone ID
  name    = "demo.jaypatel.link"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_s3_bucket.demo.website_endpoint]
  depends_on = [aws_s3_bucket.demo]
}
