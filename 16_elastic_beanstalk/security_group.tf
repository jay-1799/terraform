resource "aws_security_group" "sg15" {
    vpc_id = aws_vpc.vpc15.id
    name        = "application - production"
    description = "security group for my app"

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "sg15"
    }
}

resource "aws_security_group" "allow_mariadb" {
    vpc_id = aws_vpc.vpc15.id
    name = "allow_mariadb"
    
    ingress{
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [aws_security_group.sg15.id]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        self = true
    }
    tags = {
        Name = "allow_mariadb"
    }
}