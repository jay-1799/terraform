resource aws_default_subnet "default_subnet_1" {
    availability_zone = var.availability_zone

    tags = {
        Name = "default_subnet_1"
    }
}