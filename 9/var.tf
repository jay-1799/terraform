variable "aws_region" {
    default = "us-east-1"
}


variable "ami_id" {
  description = "AMI for aws EC2 instance"
  default = "ami-04e5276ebb8451442"
}

variable "PATH_TO_PRIVATE_KEY" {
  description = "path of the private key file"
  default = "C:/Users/Jay Patel/Downloads/7.20.pem"
}