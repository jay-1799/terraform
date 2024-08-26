provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
    ami = var.ami_id
    instance_type = var.instance_type

    tags={
        Name = var.instance_name
    }
}

terraform {
  backend "s3" {
    bucket         = "jay-remote-backend-13"
    key            = "jay/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}