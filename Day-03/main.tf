############################
# DATA SOURCES
############################

data "aws_availability_zones" "available" {}

data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

############################
# VPC
############################

resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  tags = merge(var.common_tags, {
    Name = "terraweek-vpc"
  })
}

############################
# PUBLIC SUBNET
############################

resource "aws_subnet" "public" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_cidr

  availability_zone = data.aws_availability_zones.available.names[0]

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

############################
# INTERNET GATEWAY
############################

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraweek-igw"
  }
}

############################
# ROUTE TABLE
############################

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {

  subnet_id = aws_subnet.public.id

  route_table_id = aws_route_table.public.id
}

############################
# SECURITY GROUP
############################

resource "aws_security_group" "web" {

  name = "terraweek-sg"

  vpc_id = aws_vpc.main.id

  dynamic "ingress" {

    for_each = var.security_ports

    content {

      description = ingress.key

      from_port = ingress.value

      to_port = ingress.value

      protocol = "tcp"

      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {

    create_before_destroy = true

    ignore_changes = [
      tags
    ]
  }

  tags = {
    Name = "terraweek-sg"
  }
}

############################
# EC2
############################

resource "aws_instance" "web" {

  count = var.instance_count

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  depends_on = [
    aws_internet_gateway.igw
  ]

  user_data = <<EOF
#!/bin/bash
dnf update -y
dnf install nginx -y
systemctl enable nginx
systemctl start nginx
echo "<h1>Terraform Day 3 - Instance ${count.index}</h1>" > /usr/share/nginx/html/index.html
EOF

  lifecycle {

    ignore_changes = [
      user_data
    ]
  }

  tags = merge(var.common_tags, {
    Name = "web-${count.index + 1}"
  })
}

############################
# BONUS
# Elastic IP
############################

resource "aws_eip" "web" {

  instance = aws_instance.web[0].id

  domain = "vpc"

  depends_on = [
    aws_internet_gateway.igw
  ]

  tags = {
    Name = "terraweek-eip"
  }
}

############################
# BONUS
# for_each Example
############################

resource "aws_s3_bucket" "demo" {

  for_each = toset([
    "sourodip-day3-demo1",
    "sourodip-day3-demo2"
  ])

  bucket = each.key

  force_destroy = true

  lifecycle {

    prevent_destroy = false
  }

  tags = merge(var.common_tags, {
    Name = each.key
  })
}