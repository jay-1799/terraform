resource "aws_security_group" "ecs-sg" {
    vpc_id = aws_vpc.vpc15.id
    name        = "ecs-sg"
    description = "security group for ecs"

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        security_groups = [aws_security_group.elb-sg.id]
    }
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
        Name = "ecs-sg"
    }
}

resource "aws_security_group" "elb-sg" {
    vpc_id = aws_vpc.vpc15.id
    name = "elb-sg"
    
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        self = true
    }
    tags = {
        Name = "elb-sg"
    }
}