resource "aws_acm_certificate" "demo_certificate" {
  domain_name       = "demo.jaypatel.link"
  validation_method = "DNS"

  subject_alternative_names = ["demo.jaypatel.link"]

  lifecycle {
    create_before_destroy = true
  }
}