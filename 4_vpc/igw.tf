resource "aws_internet_gateway" "igw1" {
    vpc_id = aws_vpc.c4.id
    tags = {
        Name = "igw1"
    }
}
