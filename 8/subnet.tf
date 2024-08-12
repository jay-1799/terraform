resource "aws_subnet" "subnet12" {
    vpc_id = aws_vpc.vpc12.id
    cidr_block = var.cidr_subnet
    map_public_ip_on_launch = true
    availability_zone = var.availability_zone
    tags = {
        Environment = var.environment_tag
    }

}