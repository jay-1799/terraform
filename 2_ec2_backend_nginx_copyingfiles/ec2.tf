resource "aws_instance" "challenge-1" {
    ami           = "ami-04e5276ebb8451442"
    instance_type = "t2.micro"
    # count = 2
    vpc_security_group_ids = [aws_security_group.instance_sg.id]
    key_name = aws_key_pair.my_key.key_name
}

resource "aws_instance" "challenge-2" {
    ami           = "ami-04e5276ebb8451442"
    instance_type = "t2.micro"
    # count = 2
    vpc_security_group_ids = [aws_security_group.instance_sg.id]
    key_name = aws_key_pair.my_key.key_name
}