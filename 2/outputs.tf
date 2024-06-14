output "instance_public_ip_1" {
    description = "IP address of ec2 instance"
    value = aws_instance.challenge-1.public_ip
}
output "instance_public_ip_2" {
    description = "IP address of ec2 instance"
    value = aws_instance.challenge-2.public_ip
}