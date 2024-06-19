locals {
  name = var.name

  create_command = "docker build -t ${local.name} ."
}

resource "null_resource" "docker_image" {
  provisioner "local-exec" {
    command = local.create_command
  }

  triggers = {
    name = var.name
  }

  provisioner "local-exec" {
    when    = destroy
    command = "docker rmi ${self.triggers.name}"
  }
}
