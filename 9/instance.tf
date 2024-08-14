resource "aws_instance" "ec14" {
    ami = var.ami_id
    instance_type = "t2.micro"
    subnet_id  = aws_subnet.public1.id
    vpc_security_group_ids = [aws_security_group.sg14.id]
    key_name = "key14"
}

resource "aws_ebs_volume" "ebs14" {
    availability_zone = "us-east-1a"
    size = 10
    type = "gp2"
    tags = {
        Name = "ebs14"
    }
}

resource "aws_volume_attachment" "ebs14_attachment"{
    device_name = "/dev/xvdh"
    volume_id = aws_ebs_volume.ebs14.id
    instance_id = aws_instance.ec14.id
}