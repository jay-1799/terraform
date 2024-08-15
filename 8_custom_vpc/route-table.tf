resource "aws_route_table" "rt12" {
    vpc_id = aws_vpc.vpc12.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw12.id
    }
    tags = {
        Environment = var.environment_tag
    }
}


resource "aws_route_table_association" "rta12" {
    subnet_id = aws_subnet.subnet12.id
    route_table_id = aws_route_table.rt12.id
}