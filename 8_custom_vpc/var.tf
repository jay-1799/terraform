variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default = "10.1.0.0/24"
}
variable "availability_zone" {
  description = "availability zone to create subnet"
  default = "us-east-1a"
}

variable "ami_id" {
  description = "AMI for aws EC2 instance"
  default = "ami-04e5276ebb8451442"
}

variable "environment_tag" {
  description = "Environment tag"
  default = "dev"
}