variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "instance_count" {
  default = 2
}

variable "common_tags" {
  default = {
    Project = "TerraWeek-Day03"
    Owner   = "Sourodip"
  }
}

variable "security_ports" {
  default = {
    HTTP = 80
    SSH  = 22
  }
}