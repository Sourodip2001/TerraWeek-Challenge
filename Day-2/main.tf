provider "docker" {}

# --- Locals Block showcasing Expressions and Built-in Functions ---
locals {
  # Function 1 & 2: upper() and format() inside a conditional expression (Bonus Point)
  env_suffix = var.environment == "prod" ? upper("production") : upper(var.environment)
  
  # Function 3: join() to form a deterministic system name prefix
  name_prefix = join("-", ["tws", "terraweek", lower(local.env_suffix)])

  # Function 4: merge() to seamlessly combine global labels and environmental context tags
  final_tags = merge(var.container_labels, {
    Environment = local.env_suffix
    DeployedAt  = "2026-July"
  })

  # Bonus Point: for expression transforming collection inputs
  transformed_names = [for name in var.container_names : upper(name)]
}

# Pulls the Nginx Image
resource "docker_image" "nginx" {
  name         = var.docker_settings.image_name
  keep_locally = false
}

# Deploys the Nginx Container driven fully by HCL expressions
resource "docker_container" "web" {
  image = docker_image.nginx.image_id
  # References our computed name_prefix local value
  name  = "${local.name_prefix}-web"

  ports {
    internal = 80
    external = 8080
  }

  # Dynamic label extraction from merged dictionary block
  labels {
    label = "project"
    value = local.final_tags["Project"]
  }

  labels {
    label = "managed_by"
    value = local.final_tags["ManagedBy"]
  }
}