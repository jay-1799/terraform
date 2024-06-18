resource "aws_vpc" "c4" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "c4"
    }
}

resource "aws_subnet" "subnet18" {
     vpc_id = aws_vpc.c4.id
     cidr_block = "10.0.1.0/24"
     availability_zone = "us-east-1a"

     tags = {
        Name = "subnet18"
     }
}



