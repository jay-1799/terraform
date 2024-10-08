resource "aws_security_group" "sg12" {
    name = "sg12"
    vpc_id = aws_vpc.vpc12.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Environment = var.environment_tag
    }
}