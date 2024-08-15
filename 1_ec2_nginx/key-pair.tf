resource "aws_key_pair" "my_key" {
  key_name   = "7.20"
  public_key = file("C:/Users/Jay Patel/Downloads/publickey.pub")  # Replace with the path to your public key
}