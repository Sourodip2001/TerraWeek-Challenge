terraform {

  backend "s3" {

    bucket = "sourodip-terraweek-state-2026"

    key = "day04/terraform.tfstate"

    region = "us-east-1"

    encrypt = true

    use_lockfile = true

  }

}