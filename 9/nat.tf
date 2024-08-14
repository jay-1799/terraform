resource "aws_eip" "nat" {
    domain = "vpc"
    # vpc = true
}

resource "aws_nat_gateway" "nat14" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.public1.id
    depends_on = [ aws_internet_gateway.igw14 ]
}

resource "aws_route_table" "main_private" {
    vpc_id = aws_vpc.vpc14.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat14.id

    }
    tags = {
        Name = "main_private"
    }
}

resource "aws_route_table_association" "main-private-1a" {
    subnet_id = aws_subnet.private1.id
    route_table_id = aws_route_table.main_private.id
}
resource "aws_route_table_association" "main-private-2a" {
    subnet_id = aws_subnet.private2.id
    route_table_id = aws_route_table.main_private.id
}
resource "aws_route_table_association" "main-private-3a" {
    subnet_id = aws_subnet.private3.id
    route_table_id = aws_route_table.main_private.id
}