# Terraform AWS EC2 Module

A reusable and customizable Terraform module for provisioning an AWS EC2 instance with configurable networking, security groups, tags, and environment-specific settings.

This module was developed as part of **TerraWeek Challenge 2026 – Day 05: Modules: Reusable, Composable Infrastructure** by **TrainWithShubham**.

---

## 📖 Overview

Terraform Modules are reusable building blocks that help eliminate duplicate code and promote consistency across infrastructure deployments.

This module provisions a single EC2 instance and is designed to be reused across multiple environments by accepting all infrastructure-specific values as input variables instead of performing resource lookups internally.

---

## ✨ Features

- Reusable EC2 Instance Module
- Supports custom AMI IDs
- Configurable Instance Type
- Configurable Environment
- Accepts existing Subnet ID
- Accepts existing Security Groups
- Custom Resource Tags
- Input Validation
- Module Outputs
- Production-friendly design
- Compatible with Terraform 1.5+

---

# 📂 Repository Structure

```text
terraform-aws-ec2-module/
│
├── README.md
├── main.tf
├── variables.tf
└── outputs.tf
```

---

# 🚀 Requirements

| Name | Version |
|------|----------|
| Terraform | >= 1.5 |
| AWS Provider | >= 6.0 |

---

# 📦 Usage

## Local Module

```hcl
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

module "web_server" {

  source = "./modules/ec2_instance"

  name                   = "web"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = "subnet-0123456789abcdef0"
  vpc_security_group_ids = ["sg-0123456789abcdef0"]

  instance_type = "t2.micro"
  environment   = "dev"

  tags = {
    Owner   = "Sourodip Nath"
    Project = "TerraWeek"
  }

}
```

---

# 🌐 Usage via GitHub Module

Since this module has been published to GitHub, it can be consumed directly.

```hcl
module "web_server" {

  source = "git::https://github.com/Sourodip2001/terraform-aws-ec2-module.git?ref=v1.0.0"

  name                   = "web"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = "subnet-0123456789abcdef0"
  vpc_security_group_ids = ["sg-0123456789abcdef0"]

  instance_type = "t2.micro"
  environment   = "dev"

}
```

---

# 📥 Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Logical name of the EC2 instance | string | n/a | ✅ |
| ami | AMI ID | string | n/a | ✅ |
| subnet_id | Subnet ID | string | n/a | ✅ |
| vpc_security_group_ids | List of Security Group IDs | list(string) | n/a | ✅ |
| instance_type | EC2 Instance Type | string | `"t2.micro"` | ❌ |
| environment | Deployment Environment | string | `"dev"` | ❌ |
| tags | Additional Tags | map(string) | `{}` | ❌ |

---

# 📤 Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 Instance ID |
| public_ip | Public IP Address |
| private_ip | Private IP Address |

---

# ✅ Input Validation

This module validates user input before creating infrastructure.

Example:

```hcl
variable "environment" {

  type = string

  validation {

    condition = contains(
      ["dev","staging","prod"],
      var.environment
    )

    error_message = "Environment must be dev, staging or prod."

  }

}
```

---

# 🏗 Example

Deploy multiple servers using `for_each`.

```hcl
module "servers" {

  source = "git::https://github.com/Sourodip2001/terraform-aws-ec2-module.git?ref=v1.0.0"

  for_each = toset([
    "app",
    "worker",
    "cache"
  ])

  name                   = each.key
  ami                    = data.aws_ami.al2023.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = local.security_group_ids

}
```

Terraform will provision:

- EC2 App Server
- EC2 Worker Server
- EC2 Cache Server

using the same reusable module.

---

# 🔖 Versioning

This module follows Git Tags for versioning.

Example:

```hcl
source = "git::https://github.com/Sourodip2001/terraform-aws-ec2-module.git?ref=v1.0.0"
```

Future releases:

```
v1.0.0
v1.1.0
v2.0.0
```

Pinning module versions ensures reproducible infrastructure deployments and prevents unexpected breaking changes.

---

# 💻 Commands

Initialize Terraform

```bash
terraform init
```

Validate Configuration

```bash
terraform validate
```

Preview Changes

```bash
terraform plan
```

Deploy Infrastructure

```bash
terraform apply
```

View Outputs

```bash
terraform output
```

Destroy Infrastructure

```bash
terraform destroy
```

---

# 🎯 Best Practices Followed

- Modular Design
- Input Validation
- Outputs for Reusability
- Parameterized Infrastructure
- Environment-based Configuration
- Custom Tags
- Version Pinning
- Git Version Control

---

# 📚 TerraWeek Day 05 Concepts Covered

- Terraform Modules
- Root Module
- Child Module
- Module Inputs
- Module Outputs
- Module Composition
- `for_each`
- AWS EC2 Module
- Git Module Source
- Version Pinning
- Input Validation
- Infrastructure Reusability

---

# 📄 License

This project is licensed under the MIT License.

---

# 👨‍💻 Author

**Sourodip Nath**

DevOps Engineer | AWS | Terraform | Docker | Kubernetes | CI/CD

Built as part of the **TerraWeek Challenge 2026** organized by **TrainWithShubham**.

If you found this module useful, consider ⭐ starring the repository.
