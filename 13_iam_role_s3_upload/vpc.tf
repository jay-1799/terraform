resource "aws_vpc" "vpc15" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = "true"
    enable_dns_support = "true"
    tags = {
        Name = "vpc15"
    }
}

resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.vpc15.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
    tags = {
        Name = "public_subnet1"
    }
}
resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.vpc15.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1b"
    tags = {
        Name = "public_subnet2"
    }
}
resource "aws_subnet" "public_subnet3" {
    vpc_id = aws_vpc.vpc15.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1c"
    tags = {
        Name = "public_subnet3"
    }
}
resource "aws_subnet" "private_subnet1" {
    vpc_id = aws_vpc.vpc15.id
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = false
    availability_zone = "us-east-1a"
    tags = {
        Name = "private_subnet1"
    }
}
resource "aws_subnet" "private_subnet2" {
    vpc_id = aws_vpc.vpc15.id
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = false
    availability_zone = "us-east-1b"
    tags = {
        Name = "private_subnet2"
    }
}
resource "aws_subnet" "private_subnet3" {
    vpc_id = aws_vpc.vpc15.id
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = false
    availability_zone = "us-east-1c"
    tags = {
        Name = "private_subnet3"
    }
}

resource "aws_internet_gateway" "igw15" {
    vpc_id = aws_vpc.vpc15.id
    tags = {
        Name = "igw15"
    }
}

resource "aws_route_table" "rtb15" {
    vpc_id = aws_vpc.vpc15.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw15.id
    }
    tags = {
        Name = "public1"
    }
}

resource "aws_route_table_association" "rtbpublic1" {
    subnet_id = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.rtb15.id
}
resource "aws_route_table_association" "rtbpublic2" {
    subnet_id = aws_subnet.public_subnet2.id
    route_table_id = aws_route_table.rtb15.id
}
resource "aws_route_table_association" "rtbpublic3" {
    subnet_id = aws_subnet.public_subnet3.id
    route_table_id = aws_route_table.rtb15.id
}