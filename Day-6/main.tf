locals {
  # Task 1: Workspace logic adjustment to scale sizing automatically
  instance_size = terraform.workspace == "prod" ? "t3.medium" : "t2.micro"
  env_context   = terraform.workspace
}

# 1. Registry Module: Official AWS VPC Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "capstone-vpc-${local.env_context}"
  cidr = var.vpc_cidr

  azs             = ["${var.aws_region}a", "${var.aws_region}b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = var.environment_tags
}

# 2. Security Group Declaration for Infrastructure Ingress Control
resource "aws_security_group" "web_sg" {
  name        = "web-access-sg-${local.env_context}"
  description = "Allow port 80 traffic internally"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.environment_tags
}

# 3. Custom Local Module Call (Compute Layer Module with loop structure)
module "compute_cluster" {
  source   = "./modules/compute"
  for_each = toset(["frontend", "backend"])

  instance_name      = "${each.key}-${local.env_context}"
  instance_type      = local.instance_size
  subnet_id          = module.vpc.public_subnets[0] # Dynamic dependency composition
  security_group_ids = [aws_security_group.web_sg.id]
  
  tags = var.environment_tags
}

# 🔒 BONUS 3: Ephemeral Values + Write-Only arguments (Terraform 1.11+)
ephemeral "random_password" "db_secret" {
  length  = 24
  special = false
}

resource "aws_db_instance" "secure_database" {
  allocated_storage   = 20
  engine              = "postgres"
  
  # 🔄 FIXED: Upgraded from deprecated 16.1 to active minor version 16.14
  engine_version      = "16.14" 
  
  instance_class      = "db.t3.micro"
  username            = "db_admin"
  db_name             = "capstone_${local.env_context}"
  skip_final_snapshot = true

  password_wo         = ephemeral.random_password.db_secret.result
  password_wo_version = 1 
}