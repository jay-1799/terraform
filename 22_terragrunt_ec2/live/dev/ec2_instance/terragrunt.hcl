include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/ec2_instance"
}

inputs = {
    aws_region = "us-east-1"
    ami_id = "ami-04e5276ebb8451442"
    instance_type  = "t2.micro"
    instance_name  = "dev-instance"
}