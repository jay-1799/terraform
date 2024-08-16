resource "aws_s3_bucket" "b16" {
  bucket = "jay17999"
#   acl    = "private"

  tags = {
    Name = "jay17999"
  }
}