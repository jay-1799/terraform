resource "aws_route53_record" "demorecord" {
    zone_id = aws_route53_zone.jaypatel_link.id
    name = "demo.jaypatel.link"
    type = "A"
    ttl = "300"
    records = [aws_instance.e810.public_ip]
}