resource "aws_instance" "e12" {
    ami=var.ami_id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnet12.id
    vpc_security_group_ids = [aws_security_group.sg12.id]
    key_name = "key12"
    tags = {
        Environment = var.environment_tag
    }
}