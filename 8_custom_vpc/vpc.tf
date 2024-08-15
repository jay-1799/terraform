resource "aws_vpc" "vpc12" {
    cidr_block = var.cidr_vpc
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Environment = var.environment_tag
    }
}