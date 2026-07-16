# 1. Resolve AMI once in the root module
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# 2. Task 4: Consume a Registry Module + Version Locking
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "terraweek-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Environment = "dev"
    Challenge   = "TerraWeek"
  }
}

# 3. Task 2: Call your custom local module for a single instance
module "web_server" {
  source                 = "./modules/ec2_instance"
  name                   = "web"
  instance_type          = "t2.micro"
  environment            = "dev"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = module.vpc.public_subnets[0] # Bonus: Composing outputs from the VPC module
  vpc_security_group_ids = [module.vpc.default_security_group_id]

  tags = {
    Owner = "Challenge-Participant"
  }
}

# 4. Task 3: Modular Composition using for_each
module "servers" {
  source   = "./modules/ec2_instance"
  for_each = toset(["app", "worker", "cache"])

  name                   = each.key
  instance_type          = "t2.micro"
  environment            = "dev"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = module.vpc.public_subnets[1]
  vpc_security_group_ids = [module.vpc.default_security_group_id]
}