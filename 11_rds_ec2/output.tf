output "instance" {
  value = aws_instance.ec15.public_ip
}

output "rds" {
  value = aws_db_instance.mariadb.endpoint
}