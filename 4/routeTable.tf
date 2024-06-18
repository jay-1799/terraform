resource "aws_route_table" "routetable1" {
    vpc_id = aws_vpc.c4.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw1.id
    }
    tags= {
        Name = "route table 1"
    }
}

resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.subnet18.id
  route_table_id = aws_route_table.routetable1.id
}
