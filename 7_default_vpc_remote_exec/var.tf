variable "availability_zone" {
  description = "availability zone to create subnet"
  default = "us-east-1a"
}

# variable "instance_ami" {
#   description = "AMI for aws EC2 instance"
#   default = "ami-0cf31d971a3ca20d6"
# }
variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}
variable "environment_tag" {
  description = "Environment tag"
  default = "dev"
}
variable "INSTANCE_USERNAME" {
  description = "username"
  default = "ec2-user"
}
variable "PATH_TO_PRIVATE_KEY" {
  description = "path of the private key file"
  default = "C:/Users/Jay Patel/Downloads/7.20.pem"
}