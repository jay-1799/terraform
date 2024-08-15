output "instance_public_ip_1" {
    description = "IP address of ec2 instance"
    value = aws_instance.challenge-1.public_ip
}
