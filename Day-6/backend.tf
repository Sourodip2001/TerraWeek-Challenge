terraform {
  # Standard Native S3 Backend with DynamoDB State Locking (Day 4/6 Requirement)
  backend "s3" {
    bucket         = "tws-terraweek-state-bucket" # Must be globally unique
    key            = "capstone/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tws-terraweek-lock-table"
    encrypt        = true
  }

  # ☁️ BONUS 1: HCP Terraform Cloud Migrated Context (Uncomment to activate)
  # cloud {
  #   organization = "nath-society-ops"
  #   workspaces {
  #     tags = ["terraweek-capstone"]
  #   }
  # }
}