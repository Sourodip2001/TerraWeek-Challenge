terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.5"
    }

    random = {
      source = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "local" {}

provider "random" {}

resource "random_pet" "name" {
  length = 2
}

resource "local_file" "greeting" {
  filename = "greeting.txt"

  content = <<EOF
Hello from Terraform!

Random Name:
${random_pet.name.id}

Welcome to TerraWeek Day-01.
EOF
}
