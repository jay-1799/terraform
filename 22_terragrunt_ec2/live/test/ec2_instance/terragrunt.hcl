include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/ec2-instance"
}

inputs = {
  aws_region     = "us-west-2"
  ami_id         = "ami-04e5276ebb8451442"  # Replace with a valid AMI ID for test
  instance_type  = "t2.micro"
  instance_name  = "test-instance"
}