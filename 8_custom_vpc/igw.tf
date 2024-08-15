resource "aws_internet_gateway" "igw12" {
    vpc_id = aws_vpc.vpc12.id
    tags = {
        Environment = var.environment_tag
    }
}