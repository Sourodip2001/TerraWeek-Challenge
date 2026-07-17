variable "aws_region" {
  type        = string
  description = "Target deployment region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  description = "Base CIDR range allocation for the VPC framework"
  default     = "10.0.0.0/16"
}

variable "environment_tags" {
  type        = map(string)
  description = "Base tracking metadata applied across child infrastructures"
  default = {
    Challenge = "TerraWeek-Capstone"
    ManagedBy = "Terraform"
  }
}