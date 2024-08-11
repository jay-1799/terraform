data "aws_ami" "amazon_linux_1" {
    most_recent = true
    owners      = ["amazon"]
    filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

    filter {
    name   = "architecture"
    values = ["x86_64"]
  }

    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

    filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource aws_instance "e810" {
    ami = data.aws_ami.amazon_linux_1.id
    instance_type = var.instance_type
    subnet_id = aws_default_subnet.default_subnet_1.id
    vpc_security_group_ids = [aws_security_group.sg810.id]
    key_name = aws_key_pair.k810.key_name
    tags= {
        Name = "810"
    }
}
