resource "aws_key_pair" "k810" {
    key_name = "k810"
    public_key = file("C:/Users/Jay Patel/Downloads/publickey.pub")
}