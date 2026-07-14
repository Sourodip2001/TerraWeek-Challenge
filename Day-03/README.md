
Welcome to **Day 03** of the **#TerraWeekChallenge**! 🚀

In this challenge, I provisioned my first cloud infrastructure on AWS using **Terraform**, explored **providers**, **resources**, **data sources**, and practiced Terraform **meta-arguments** like `count`, `for_each`, `depends_on`, and `lifecycle`.

---

## 📚 Learning Objectives

- Configure AWS Provider with version pinning
- Understand Resources vs Data Sources
- Create AWS Infrastructure using Terraform
- Use Terraform Meta Arguments
- Manage Infrastructure Lifecycle
- Provision and Destroy Infrastructure Safely

---

## 🛠️ Tech Stack

- Terraform v1.8+
- AWS Provider `~> 6.0`
- AWS EC2
- AWS VPC
- AWS Subnet
- Internet Gateway
- Route Table
- Security Group
- Elastic IP
- Amazon Linux 2023

---

## 📁 Project Structure

```
example/
├── main.tf
├── outputs.tf
├── terraform.tf
└── variables.tf
```

---

# 🚀 Infrastructure Created

This project provisions the following AWS resources:

- ✅ VPC
- ✅ Public Subnet
- ✅ Internet Gateway
- ✅ Route Table
- ✅ Route Table Association
- ✅ Security Group
- ✅ EC2 Instance(s)
- ✅ Elastic IP
- ✅ S3 Buckets (for_each example)

---

# 📖 Terraform Concepts Covered

## Provider Version Pinning

```hcl
terraform {
  required_version = ">= 1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
```

### Why Version Pinning?

Version pinning ensures that everyone working on the project uses compatible provider versions, preventing unexpected breaking changes.

The `~>` (pessimistic constraint) allows patch and minor updates while preventing incompatible major upgrades.

Example:

```
~> 6.0
```

Allows:

- 6.0.1
- 6.1.0
- 6.5.2

But **not**

- 7.0.0

---

## Provider Alias

A secondary provider alias is configured for another AWS region.

```hcl
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}
```

This is useful when:

- Disaster Recovery
- Multi-region deployments
- Cross-region replication
- Global architectures

---

# 📖 Resources vs Data Sources

## Resource

Resources create and manage infrastructure.

Example:

```hcl
resource "aws_instance" "web" {}
```

Terraform creates, updates, and destroys these resources.

---

## Data Source

Data sources only read existing infrastructure.

Example:

```hcl
data "aws_ami" "amazon_linux" {}
```

Used to retrieve:

- Latest AMI
- Availability Zones
- Existing VPC
- Existing IAM Roles

without creating them.

---

# 📖 Meta Arguments Used

## count

Creates multiple identical resources.

```hcl
resource "aws_instance" "web" {
  count = 2
}
```

---

## for_each

Creates resources with unique identities.

```hcl
resource "aws_s3_bucket" "demo" {
  for_each = toset([
    "bucket1",
    "bucket2"
  ])
}
```

---

## depends_on

Forces Terraform to create resources in a specific order.

```hcl
depends_on = [
  aws_internet_gateway.igw
]
```

---

## lifecycle

Controls resource lifecycle.

Used:

- create_before_destroy
- ignore_changes

Example:

```hcl
lifecycle {
  create_before_destroy = true

  ignore_changes = [
    tags
  ]
}
```

---

# 🌐 Network Architecture

```
                    Internet
                        │
                        │
                Internet Gateway
                        │
                        │
                 Route Table
                        │
                        │
                 Public Subnet
                        │
              ┌─────────┴─────────┐
              │                   │
         Security Group       Elastic IP
              │
              │
         EC2 Instance
              │
         Nginx Web Server
```

---

# ⭐ Bonus Features Implemented

- Elastic IP
- User Data Script
- Automatic Nginx Installation
- Dynamic Security Group Rules
- Multiple EC2 Instances using `count`
- Multiple S3 Buckets using `for_each`
- Provider Alias
- Terraform Outputs

---

# 📦 User Data

The EC2 instance automatically:

- Updates packages
- Installs Nginx
- Enables the service
- Starts Nginx
- Creates a custom HTML page

---

# ▶️ How to Run

## Initialize

```bash
terraform init
```

---

## Format

```bash
terraform fmt
```

---

## Validate

```bash
terraform validate
```

---

## Plan

```bash
terraform plan
```

---

## Apply

```bash
terraform apply
```

Type:

```
yes
```

---

## View State

```bash
terraform state list
```

---

## View Outputs

```bash
terraform output
```

---

## Generate Dependency Graph

```bash
terraform graph | dot -Tpng > graph.png
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

Type:

```
yes
```

---

# 📸 Screenshots

Add screenshots of:

- Terraform Init
- Terraform Plan
- Terraform Apply
- AWS Console (VPC, EC2, Subnet)
- Nginx running
- Terraform Destroy

---

# 🎯 Key Learnings

- Terraform Provider Configuration
- Version Pinning
- Resources vs Data Sources
- Terraform State
- AWS Networking Basics
- EC2 Provisioning
- Meta Arguments
- Infrastructure as Code (IaC)
- Safe Infrastructure Lifecycle Management

---

# 📚 References

- Terraform Documentation
- AWS Provider Documentation
- TerraWeek Challenge
