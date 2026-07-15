variable "container_name" {
  description = "Container Name"
  type        = string
  default     = "terraweek-nginx"
}

variable "external_port" {
  description = "External Port"

  type = number

  default = 8080

  validation {
    condition     = var.external_port >= 1024 && var.external_port <= 65535
    error_message = "Port must be between 1024 and 65535."
  }
}

variable "enable_logs" {
  type    = bool
  default = true
}

variable "allowed_users" {
  type = list(string)

  default = [
    "alice",
    "bob",
    "charlie"
  ]
}

variable "common_tags" {
  type = map(string)

  default = {
    Project = "TerraWeek"
    Owner   = "Sourodip"
  }
}

variable "regions" {
  type = set(string)

  default = [
    "us-east-1",
    "ap-south-1",
    "eu-west-1"
  ]
}

variable "vm_config" {
  type = object({
    cpu    = number
    memory = number
    os     = string
  })

  default = {
    cpu    = 2
    memory = 2048
    os     = "Ubuntu"
  }
}

variable "server_tuple" {
  type = tuple([
    string,
    number,
    bool
  ])

  default = [
    "nginx",
    80,
    true
  ]
}

variable "environment" {

  type    = string
  default = "dev"

  validation {

    condition = contains(
      [
        "dev",
        "staging",
        "prod"
      ],
      var.environment
    )

    error_message = "Environment must be dev, staging or prod."
  }
}

variable "db_password" {

  type      = string
  sensitive = true

  default = "Password@123"
}
