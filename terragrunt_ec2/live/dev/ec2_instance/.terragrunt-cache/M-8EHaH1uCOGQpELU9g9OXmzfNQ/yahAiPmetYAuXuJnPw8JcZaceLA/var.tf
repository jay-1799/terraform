variable "aws_region" {
  description = "The AWS region to deploy to"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
}

variable "instance_type" {
  description = "The instance type to use"
}

variable "instance_name" {
  description = "The name to tag the instance"
}