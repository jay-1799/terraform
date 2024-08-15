terraform {
    backend "s3" {
    bucket         = "jay-remote-backend-13" # change this
    key            = "jay/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
    }
}