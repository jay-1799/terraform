resource "aws_route53_zone" "jaypatel_link" {
    name = var.zone_name
    provider = aws
}

resource "aws_route53_record" "demo_record" {
  zone_id = aws_route53_zone.jaypatel_link.zone_id
  name    = "demo.jaypatel.link"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.demo_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.demo_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
 
resource "aws_route53_record" "demo_validation" {
  for_each = {
    for dvo in aws_acm_certificate.demo_certificate.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }

  zone_id = aws_route53_zone.jaypatel_link.id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.value]
  ttl     = 300
}

