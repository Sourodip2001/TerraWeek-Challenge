# 🚀 TerraWeek Challenge 2026


**A complete hands-on journey through Terraform and Infrastructure as Code (IaC)**

Part of the **#TerraWeekChallenge** organized by **TrainWithShubham**



# 📖 About

This repository documents my progress throughout the **TerraWeek Challenge**, where I'm learning Terraform from the ground up by building real-world Infrastructure as Code projects.

The challenge starts with Terraform fundamentals and gradually progresses toward production-ready cloud infrastructure using AWS.

---

# 🛠️ Tech Stack

- Terraform
- AWS
- EC2
- VPC
- IAM
- S3
- Networking
- Infrastructure as Code (IaC)
- HCL (HashiCorp Configuration Language)
- Git & GitHub

---

# 📂 Repository Structure

```
TerraWeek/
│
├── day01/
│   ├── README.md
│   ├── main.tf
│   └── ...
│
├── day02/
│   ├── README.md
│   ├── main.tf
│   └── ...
│
├── day03/
│   ├── README.md
│   └── example/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── terraform.tf
│
└── README.md
```

---

# 📅 Challenge Progress

| Day | Topic | Status |
|------|-------|--------|
| Day 01 | Introduction to Terraform & Infrastructure as Code | ✅ Completed |
| Day 02 | HCL Deep Dive — Variables, Types & Expressions | ✅ Completed |
| Day 03 | Providers, Resources & First Cloud Infrastructure | ✅ Completed |

---

# 📚 Day 01 — Introduction to Terraform

📂 Folder: `day01/`

## Topics Covered

- What is Infrastructure as Code (IaC)
- Why Terraform?
- Terraform Architecture
- Terraform Lifecycle
- Terraform CLI
- Terraform Installation
- Provider Plugins
- Terraform State
- Terraform Plan
- Terraform Apply
- Terraform Destroy
- Terraform Lock File

### Hands-on

- Installed Terraform
- Configured VS Code Extension
- Created first Terraform project
- Used Local Provider
- Used Random Provider
- Generated local resources
- Destroyed resources safely

### Commands Practiced

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

# 📚 Day 02 — HCL Deep Dive

📂 Folder: `day02/`

## Topics Covered

- HCL Syntax
- Blocks
- Arguments
- Expressions
- Variables
- Primitive Types
- Collection Types
- Object Types
- Functions
- String Interpolation
- Outputs
- Sensitive Variables
- Variable Precedence
- Docker Provider

### Hands-on

- Deployed Docker Container
- Used Variables
- Used terraform.tfvars
- Used terraform console
- Created Outputs
- Tested Variable Precedence
- Used Built-in Functions

### Commands Practiced

```bash
terraform console
terraform plan
terraform apply
terraform output
terraform destroy
```

---

# 📚 Day 03 — Providers, Resources & First Cloud Infrastructure

📂 Folder: `day03/`

## Topics Covered

- AWS Provider
- Version Pinning
- Provider Alias
- Resources
- Data Sources
- count
- for_each
- depends_on
- lifecycle
- User Data
- Elastic IP

### Infrastructure Created

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- EC2 Instance
- Elastic IP
- S3 Buckets

### Bonus Features

- Automatic Nginx Installation
- Provider Alias
- Dynamic Security Group Rules
- Multiple EC2 Instances
- Terraform Outputs
- Dependency Graph

### Commands Practiced

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform state list
terraform graph
terraform destroy
```

---

# 🎯 Terraform Concepts Learned So Far

## Core Concepts

- Infrastructure as Code
- Declarative Infrastructure
- Terraform Workflow
- Providers
- Resources
- Data Sources
- State Management
- Outputs
- Variables
- Expressions
- Modules
- Functions

---

## Advanced Concepts

- Version Constraints
- Provider Aliases
- Dynamic Blocks
- count
- for_each
- depends_on
- lifecycle
- Variable Precedence
- User Data
- Dependency Graph

---

# 🚀 Terraform Workflow

```text
Write Code
     │
     ▼
terraform init
     │
     ▼
terraform fmt
     │
     ▼
terraform validate
     │
     ▼
terraform plan
     │
     ▼
terraform apply
     │
     ▼
Infrastructure Created
     │
     ▼
terraform destroy
```

---

# 📸 Screenshots

Each day's folder contains screenshots including:

- Terraform Init
- Terraform Plan
- Terraform Apply
- AWS Console
- Terraform Outputs
- Terraform Destroy

---

# 📖 Learning Resources

- Terraform Documentation
- AWS Documentation
- Terraform Registry
- HashiCorp Learn
- TrainWithShubham TerraWeek Challenge

---

# 🎯 What's Next?

Upcoming topics include:

- Terraform Modules
- Remote State
- Backend Configuration
- Workspaces
- IAM
- S3 Backend
- DynamoDB Locking
- Advanced AWS Infrastructure


