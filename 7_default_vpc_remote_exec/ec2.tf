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

    provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  
  # First, create the directory where you want to place the website files
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /tmp/website",
      "sudo chmod 777 /tmp/website"
    ]
  }

  # Then, copy the index.html to the directory you've just created
  provisioner "file" {
    source      = "C:/Users/Jay Patel/Downloads/pw/v2"
    destination = "/tmp/website"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo mkdir -p /usr/share/nginx/html",
      "sudo cp -r /tmp/website/v2/* /usr/share/nginx/html/"
    ]
  }
    connection {
      host = coalesce(self.public_ip,self.private_ip)
      type = "ssh"
      user = var.INSTANCE_USERNAME
      private_key = file(var.PATH_TO_PRIVATE_KEY)
    }
    tags= {
        Name = "810"
    }
}

output "ip" {
  value = aws_instance.e810.public_ip
}
