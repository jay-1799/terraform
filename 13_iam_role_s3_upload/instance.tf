resource "aws_instance" "ec15" {
    ami = var.ami_id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet1.id
    vpc_security_group_ids = [aws_security_group.sg15.id]
    key_name = aws_key_pair.key15.key_name
    iam_instance_profile = aws_iam_instance_profile.s3-mybucket-role-instanceprofile.name
}