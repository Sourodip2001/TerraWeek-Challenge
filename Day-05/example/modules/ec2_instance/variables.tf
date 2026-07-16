variable "name" {
  type        = string
  description = "Logical name used in tags"
}

variable "ami" {
  type        = string
  description = "AMI ID to launch (must start with ami-)"
  
  # Bonus: Input validation rule
  validation {
    condition     = can(regex("^ami-", var.ami))
    error_message = "The ami variable must be a valid AMI ID starting with \"ami-\"."
  }
}

variable "subnet_id" {
  type        = string
  description = "Subnet to launch the instance in"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type (Free Tier: t2.micro)"
  default     = "t2.micro"
}

variable "environment" {
  type        = string
  description = "One of dev / staging / prod"
  default     = "dev"

  # Bonus: Input validation rule
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "The environment variable must be one of: dev, staging, prod."
  }
}

variable "tags" {
  type        = map(string)
  description = "Extra tags merged onto the instance"
  default     = {}
}