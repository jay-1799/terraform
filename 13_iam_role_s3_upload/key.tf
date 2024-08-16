resource "aws_key_pair" "key15" {
    key_name = "key15"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}