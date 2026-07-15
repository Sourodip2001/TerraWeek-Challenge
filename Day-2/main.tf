resource "docker_image" "nginx" {

  name = "nginx:latest"
}

resource "docker_container" "web" {

  image = docker_image.nginx.image_id

  name = local.formatted_name

  ports {

    internal = 80

    external = var.external_port
  }
}
