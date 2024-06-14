resource "aws_key_pair" "my_key" {
  key_name   = "6.13"
  public_key = file("C:/Users/Jay Patel/Downloads/publickey.pub")  # Replace with the path to your public key
}