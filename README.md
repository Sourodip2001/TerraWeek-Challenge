# 🚀 TerraWeek Challenge 2026

> **A complete hands-on journey through Terraform and Infrastructure as Code (IaC)**

Part of the **#TerraWeekChallenge** organized by **TrainWithShubham**

---

# 📖 About

Welcome to my **TerraWeek Challenge** repository!

This repository documents my hands-on learning journey through **Terraform** and **Infrastructure as Code (IaC)**. Throughout this challenge, I explore Terraform concepts from the fundamentals to advanced production-ready AWS infrastructure by building real-world projects.

Each day contains practical implementations, Terraform configurations, documentation, and screenshots that reinforce industry-standard DevOps practices.

---

# 🛠️ Tech Stack

- Terraform
- AWS
- Amazon EC2
- Amazon VPC
- Amazon S3
- IAM
- HCL (HashiCorp Configuration Language)
- Git & GitHub
- Linux
- VS Code

---

# 📂 Repository Structure

```text
TerraWeek-Challenge/
│
├── Day-01/
│   ├── README.md
│   └── ...
│
├── Day-02/
│   ├── README.md
│   └── ...
│
├── Day-03/
│   ├── README.md
│   └── ...
│
├── Day-04/
│   ├── README.md
│   ├── backend_demo/
│   ├── backend_infra/
│   └── ...
│
├── Day-05/
│   ├── README.md
│   ├── example/
│   │   ├── modules/
│   │   │   └── ec2_instance/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── terraform.tf
│   └── ...
│
└── README.md
```

---

# 📅 Challenge Progress

| Day | Topic | Status |
|------|-------|--------|
| ✅ Day 01 | Introduction to Infrastructure as Code & Terraform Basics | Completed |
| ✅ Day 02 | HCL Deep Dive – Variables, Types & Expressions | Completed |
| ✅ Day 03 | Providers, Resources & First Cloud Infrastructure | Completed |
| ✅ Day 04 | Terraform State & Remote Backends (Native Locking) | Completed |
| ✅ Day 05 | Terraform Modules – Reusable & Composable Infrastructure | Completed |

---

# 📚 Day 01 – Introduction to Terraform

### Topics Covered

- Infrastructure as Code (IaC)
- Why Terraform
- Terraform Architecture
- Terraform Workflow
- Providers
- Resources
- State
- HCL Basics
- Terraform CLI
- Terraform Lock File

### Hands-on

- Installed Terraform
- Configured VS Code Extension
- Created First Terraform Project
- Used Local Provider
- Used Random Provider
- Executed Complete Terraform Workflow

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

# 📚 Day 02 – HCL Deep Dive

### Topics Covered

- HCL Syntax
- Blocks & Arguments
- Expressions
- Variables
- Primitive Types
- Collection Types
- Object & Tuple Types
- Outputs
- Locals
- Sensitive Variables
- Variable Validation
- Variable Precedence
- Terraform Functions

### Hands-on

- Docker Provider
- Variables & terraform.tfvars
- Terraform Console
- Built-in Functions
- Conditional Expressions
- For Expressions
- Optional Object Attributes

### Commands Practiced

```bash
terraform console
terraform plan
terraform apply
terraform output
terraform destroy
```

---

# 📚 Day 03 – Providers, Resources & AWS Infrastructure

### Topics Covered

- AWS Provider
- Provider Version Constraints
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
- S3 Bucket

### Bonus

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

# 📚 Day 04 – Terraform State & Remote Backends

### Topics Covered

- Terraform State
- terraform.tfstate
- State Drift
- Local State
- Remote State
- AWS S3 Backend
- Native S3 State Locking
- Import Blocks
- moved Blocks
- removed Blocks
- check Blocks

### Hands-on

- Created Versioned S3 Backend
- Enabled Server-Side Encryption
- Migrated Local State to Remote Backend
- Configured Native State Locking (`use_lockfile = true`)
- Imported Existing Resources
- Practiced Terraform State Commands

### Commands Practiced

```bash
terraform state list
terraform state show
terraform state mv
terraform state rm
terraform show
terraform init -migrate-state
```

### Bonus

- Compared Multiple Remote Backends
- Explored S3 Bucket Versioning
- Used moved Blocks
- Used removed Blocks
- Used check Blocks

---

# 📚 Day 05 – Terraform Modules

### Topics Covered

- Root Module vs Child Module
- Local Modules
- Module Inputs & Outputs
- Module Composition
- Module Versioning
- Registry Modules
- Git Modules
- for_each with Modules
- Version Constraints

### Hands-on

- Created a reusable EC2 module
- Passed variables from the root module
- Exposed module outputs
- Used `for_each` to deploy multiple EC2 instances
- Consumed the official AWS VPC module from the Terraform Registry
- Published a reusable EC2 module to GitHub
- Created and pushed the **v1.0.0** release tag
- Learned Git-based module versioning using tags

### Module Features

- Input Variables
- Variable Validation
- Outputs
- Consistent Tagging
- Reusable Design
- README Documentation
- Git Versioning

### Commands Practiced

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy

git tag v1.0.0
git push origin v1.0.0
```

### Bonus

- Added README.md for the reusable module
- Implemented Input Validation
- Published Module to GitHub
- Versioned Module using Git Tags
- Explored Module Composition
- Passed Outputs between Modules

---

# 🎯 Terraform Concepts Learned

## Core Concepts

- Infrastructure as Code
- Declarative Infrastructure
- Providers
- Resources
- Variables
- Outputs
- Locals
- Expressions
- Functions
- Data Sources
- Modules
- State Management
- Terraform Workflow

---

## Advanced Concepts

- Provider Aliases
- Version Constraints
- Variable Validation
- Dynamic Blocks
- count
- for_each
- depends_on
- lifecycle
- Remote State
- Native S3 Locking
- Import Blocks
- moved Blocks
- removed Blocks
- check Blocks
- Local Modules
- Registry Modules
- Git Modules
- Module Versioning
- Module Composition

---

# 🚀 Terraform Workflow

```text
Write Configuration
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
Infrastructure Provisioned
        │
        ▼
terraform output
        │
        ▼
terraform destroy
```

---

# 📸 Screenshots

Each day's folder includes screenshots demonstrating:

- Terraform Init
- Terraform Validate
- Terraform Plan
- Terraform Apply
- Terraform Output
- Terraform State Commands
- AWS Console
- Remote Backend Configuration
- Module Structure
- Multi-Instance Deployment
- Terraform Destroy

---

# 📖 Learning Resources

- Terraform Documentation
- Terraform Registry
- HashiCorp Learn
- AWS Documentation
- TrainWithShubham TerraWeek Challenge

---

# 🎯 Upcoming Topics

- Terraform Workspaces
- Provisioners
- Meta Arguments
- Dynamic Blocks
- Terraform Testing
- Multi-Environment Infrastructure
- CI/CD with Terraform
- Production Infrastructure
- Terraform Best Practices
- Advanced AWS Architectures

---

# 🌟 Featured Module

As part of **Day 05**, I built and published a reusable Terraform EC2 module with versioning.

**Repository:**  
👉 https://github.com/Sourodip2001/terraform-aws-ec2-module

**Latest Version:** `v1.0.0`

---

# 🤝 Connect With Me

If you're also participating in the **#TerraWeekChallenge**, let's connect and learn together!

If you found this repository helpful, consider giving it a ⭐.

Happy Terraforming! 🚀🌍

---

# 📌 Tags

**#TerraWeekChallenge #TrainWithShubham #Terraform #AWS #DevOps #InfrastructureAsCode #IaC #CloudComputing #Automation #HashiCorp #CloudNative #Linux #GitHub #LearningInPublic**
