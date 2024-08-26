resource "aws_route53_zone" "jaypatel_link" {
    name = var.zone_name
    provider = aws
}