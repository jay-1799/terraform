resource "aws_route53_zone" "zone15" {
    name = var.zone_name
    provider = aws
}