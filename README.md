# 🚀 TerraWeek Challenge 2026

> **A complete hands-on journey through Terraform and Infrastructure as Code (IaC)**

Part of the **#TerraWeekChallenge** organized by **TrainWithShubham**

---

# 📖 About

Welcome to my **TerraWeek Challenge** repository!

This repository documents my hands-on learning journey through **Terraform** and **Infrastructure as Code (IaC)**. Throughout this challenge, I explore Terraform concepts from the fundamentals to advanced production-ready cloud infrastructure on AWS.

Each day contains practical examples, source code, notes, and documentation that reinforce real-world DevOps practices.

---

# 🛠️ Tech Stack

- Terraform
- AWS
- Amazon EC2
- Amazon S3
- Amazon VPC
- IAM
- HCL (HashiCorp Configuration Language)
- Git & GitHub
- Linux
- VS Code

---

# 📂 Repository Structure

```
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
│   ├── backend_infra/
│   ├── backend_demo/
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

---

# 📚 Day 01 – Introduction to Terraform

### Topics Covered

- Infrastructure as Code (IaC)
- Why Terraform?
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
- Verified Installation
- Used Local Provider
- Used Random Provider
- Created Local Resources
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
- Blocks
- Arguments
- Expressions
- Variables
- Primitive Types
- Collection Types
- Object Types
- Tuples
- Sets
- Maps
- Outputs
- Locals
- Sensitive Variables
- Variable Validation
- Variable Precedence
- Terraform Functions

### Hands-on

- Docker Provider
- Variables & tfvars
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
- Terraform State Commands
- Import Block
- moved Block
- removed Block
- check Block

### Hands-on

- Created Versioned S3 Backend
- Enabled Server-Side Encryption
- Configured Remote Backend
- Migrated Local State to S3
- Used Native State Locking (`use_lockfile = true`)
- Imported Existing AWS Resources
- Practiced State Management Commands

### Terraform State Commands

```bash
terraform state list
terraform state show
terraform state mv
terraform state rm
terraform show
```

### Bonus

- Compared Remote Backends
- Explored S3 Versioning
- Used moved Block
- Used removed Block
- Used check Block

---

# 🎯 Terraform Concepts Learned

## Core Concepts

- Infrastructure as Code
- Declarative Infrastructure
- Providers
- Resources
- Data Sources
- Variables
- Outputs
- Locals
- State Management
- Terraform Workflow
- Functions
- Expressions
- Modules

---

## Advanced Concepts

- Version Constraints
- Provider Alias
- Dynamic Blocks
- count
- for_each
- depends_on
- lifecycle
- Variable Validation
- Variable Precedence
- Import Block
- moved Block
- removed Block
- check Block
- Remote Backends
- Native S3 State Locking

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
- Remote Backend
- Terraform Destroy

---

# 📖 Learning Resources

- Terraform Documentation
- HashiCorp Learn
- Terraform Registry
- AWS Documentation
- TrainWithShubham TerraWeek Challenge

---

# 🎯 Upcoming Topics

- Terraform Modules
- Remote Modules
- Workspaces
- Provisioners
- Meta Arguments
- Advanced Networking
- IAM Best Practices
- Multi-Environment Deployments
- CI/CD with Terraform
- Production Infrastructure

---

# 🤝 Connect With Me

If you're also participating in **#TerraWeekChallenge**, let's connect and learn together!

If you found this repository helpful, consider ⭐ **starring** it.

Happy Terraforming! 🚀🌍

---

# 📌 Tags

**#TerraWeekChallenge #TrainWithShubham #Terraform #AWS #DevOps #InfrastructureAsCode #IaC #CloudComputing #Automation #HashiCorp #CloudNative #Linux #GitHub #LearningInPublic**
