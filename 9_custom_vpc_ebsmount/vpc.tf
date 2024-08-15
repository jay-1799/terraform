resource "aws_vpc" "vpc14" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "vpc14"
    }
}

resource "aws_subnet" "public1" {
    vpc_id = aws_vpc.vpc14.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
    tags = {
        Name = "public1"
    }
}
resource "aws_subnet" "public2" {
    vpc_id = aws_vpc.vpc14.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1b"
    tags = {
        Name = "public2"
    }
}
resource "aws_subnet" "public3" {
    vpc_id = aws_vpc.vpc14.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1c"
    tags = {
        Name = "public3"
    }
}
resource "aws_subnet" "private1" {
    vpc_id = aws_vpc.vpc14.id
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = false
    availability_zone = "us-east-1a"
    tags = {
        Name = "private1"
    }
}
resource "aws_subnet" "private2" {
    vpc_id = aws_vpc.vpc14.id
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = false
    availability_zone = "us-east-1b"
    tags = {
        Name = "private2"
    }
}
resource "aws_subnet" "private3" {
    vpc_id = aws_vpc.vpc14.id
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = false
    availability_zone = "us-east-1c"
    tags = {
        Name = "private3"
    }
}

resource "aws_internet_gateway" "igw14" {
    vpc_id = aws_vpc.vpc14.id
    tags = {
        Name = "igw14"
    }
}
resource "aws_route_table" "rtb14" {
    vpc_id = aws_vpc.vpc14.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw14.id
    }
    tags={
        Name = "rtb14"
    }
}

resource "aws_route_table_association" "main-public-1a" {
    subnet_id = aws_subnet.public1.id
    route_table_id = aws_route_table.rtb14.id
}
resource "aws_route_table_association" "main-public-2a" {
    subnet_id = aws_subnet.public2.id
    route_table_id = aws_route_table.rtb14.id
}
resource "aws_route_table_association" "main-public-3a" {
    subnet_id = aws_subnet.public3.id
    route_table_id = aws_route_table.rtb14.id
}