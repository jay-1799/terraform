resource "aws_acm_certificate_validation" "demo_cert_validation" {
  certificate_arn = aws_acm_certificate.demo_certificate.arn

  validation_record_fqdns = [
    for record in aws_route53_record.demo_validation : record.fqdn
  ]
}
