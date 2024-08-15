resource "aws_key_pair" "key15" {
    key_name = "key15"
    public_key = file(var.path_to_public_key)
}