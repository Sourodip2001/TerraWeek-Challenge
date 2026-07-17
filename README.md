# 🚀 TerraWeek Challenge 2026

> **A complete hands-on journey through Terraform and Infrastructure as Code (IaC)**

Part of the **#TerraWeekChallenge** organized by **TrainWithShubham**

---

# 📖 About

Welcome to my **TerraWeek Challenge** repository!

This repository showcases my complete hands-on journey of learning **Terraform** and **Infrastructure as Code (IaC)** through the **7-Day TerraWeek Challenge**.

Starting from Terraform fundamentals, I gradually progressed to building production-inspired AWS infrastructure using modern DevOps practices. Throughout the challenge, I explored everything from writing basic Terraform configurations to designing reusable modules, managing remote state, implementing CI/CD pipelines, testing infrastructure, and building a complete capstone project.

Over the course of this challenge, I learned and implemented:

- Infrastructure as Code (IaC)
- Terraform Fundamentals
- HashiCorp Configuration Language (HCL)
- AWS Infrastructure Provisioning
- Terraform State Management
- Remote Backends with Native S3 Locking
- Reusable Terraform Modules
- Module Versioning & Git Modules
- Terraform Workspaces
- Multi-Environment Deployments
- Native Terraform Testing
- Security Scanning with Trivy
- GitHub Actions CI/CD
- Production Best Practices
- A Complete Terraform Capstone Project
- Challenge Submission & Portfolio Preparation

Each day's folder contains Terraform configurations, documentation, screenshots, and hands-on implementations following real-world DevOps workflows and Infrastructure as Code best practices.

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
- GitHub Actions
- Terraform Test Framework
- Trivy
- Linux
- VS Code

---

# 📂 Repository Structure

```text
TerraWeek-Challenge/
│
├── Day-01/
│   └── README.md
│
├── Day-02/
│   └── README.md
│
├── Day-03/
│   └── README.md
│
├── Day-04/
│   ├── backend_demo/
│   ├── backend_infra/
│   └── README.md
│
├── Day-05/
│   ├── example/
│   │   └── modules/
│   │       └── ec2_instance/
│   └── README.md
│
├── Day-06/
│   ├── modules/
│   ├── tests/
│   ├── .github/
│   ├── README.md
│   └── ...
│
├── Day-07/
│   └── README.md
│
└── README.md
```

---

# 📅 Challenge Progress

| Day | Topic | Status |
|------|------------------------------------------------------|------------|
| ✅ Day 01 | Introduction to Infrastructure as Code & Terraform Basics | Completed |
| ✅ Day 02 | HCL Deep Dive – Variables, Types & Expressions | Completed |
| ✅ Day 03 | Providers, Resources & First AWS Infrastructure | Completed |
| ✅ Day 04 | Terraform State & Remote Backends (Native S3 Locking) | Completed |
| ✅ Day 05 | Terraform Modules – Reusable & Composable Infrastructure | Completed |
| ✅ Day 06 | Advanced Terraform + Capstone Project | Completed |
| ✅ Day 07 | Challenge Completion & Submission | Completed |

---

# 📚 Day 01 – Terraform Fundamentals

### Topics Covered

- Infrastructure as Code (IaC)
- Terraform Workflow
- Providers
- Resources
- State Management
- Terraform CLI
- Lock File

### Hands-on

- Installed Terraform
- Configured Local Provider
- Used Random Provider
- Created First Terraform Project
- Executed Complete Terraform Workflow

---

# 📚 Day 02 – HCL Deep Dive

### Topics Covered

- Variables
- Outputs
- Locals
- Expressions
- Functions
- Variable Validation
- Sensitive Variables
- Variable Precedence

### Hands-on

- Docker Provider
- terraform.tfvars
- Terraform Console
- Conditional Expressions
- For Expressions
- Built-in Functions

---

# 📚 Day 03 – AWS Infrastructure

### Topics Covered

- AWS Provider
- Resources
- Data Sources
- count
- for_each
- lifecycle
- depends_on
- Elastic IP

### Infrastructure Provisioned

- VPC
- Public Subnet
- Route Table
- Internet Gateway
- Security Groups
- EC2 Instance
- Elastic IP
- S3 Bucket

---

# 📚 Day 04 – Terraform State & Remote Backends

### Topics Covered

- Terraform State
- Local State
- Remote State
- State Drift
- State Commands
- Import Block
- moved Block
- removed Block
- check Block

### Hands-on

- Configured S3 Remote Backend
- Enabled Bucket Versioning
- Enabled Native S3 Locking
- Migrated Local State
- Imported Existing Resources
- Practiced Terraform State Commands

---

# 📚 Day 05 – Terraform Modules

### Topics Covered

- Root Module
- Child Module
- Local Modules
- Registry Modules
- Git Modules
- Module Inputs & Outputs
- Version Pinning
- Module Composition

### Hands-on

- Built reusable EC2 module
- Published module to GitHub
- Added Module README
- Implemented Variable Validation
- Created Git Tag (`v1.0.0`)
- Used Registry Module
- Used `for_each` with Modules

### Published Module

**Repository**

👉 https://github.com/Sourodip2001/terraform-aws-ec2-module

**Latest Release**

`v1.0.0`

---

# 📚 Day 06 – Advanced Terraform & Capstone Project

### Topics Covered

- Terraform Workspaces
- terraform test
- GitHub Actions
- CI/CD Pipeline
- Trivy Security Scan
- Terraform Best Practices
- Multi-Environment Deployments

### Capstone Project

Implemented a production-inspired Terraform project featuring:

- Custom EC2 Module
- Official AWS VPC Registry Module
- Remote S3 Backend
- Native State Locking
- Workspaces
- GitHub Actions CI/CD
- Terraform Test Framework
- Trivy Security Scan
- Version-Pinned Providers
- Version-Pinned Modules
- Production Folder Structure

---

# 📚 Day 07 – Challenge Completion & Submission

### Activities Completed

- Reviewed all seven days of Terraform learning
- Verified repository organization
- Updated project documentation
- Confirmed all Terraform code and examples
- Added Capstone documentation
- Verified GitHub module publication
- Ensured `.tfstate` and sensitive files were excluded from Git
- Destroyed deployed infrastructure to avoid unnecessary AWS charges
- Prepared LinkedIn posts and challenge submission
- Submitted the completed TerraWeek Challenge

### Final Deliverables

- Complete GitHub Repository
- Daily Documentation
- Capstone Project
- Published Terraform Module
- Architecture Diagrams
- Screenshots
- LinkedIn Learning Posts
- Challenge Submission

---

# 🎯 Terraform Concepts Learned

## Core Concepts

- Infrastructure as Code
- Terraform Workflow
- Providers
- Resources
- Variables
- Outputs
- Locals
- Functions
- Expressions
- Data Sources
- Modules
- State Management

---

## Advanced Concepts

- Provider Version Constraints
- Provider Aliases
- Dynamic Blocks
- count
- for_each
- lifecycle
- Remote Backends
- Native S3 Locking
- Import Blocks
- moved Blocks
- removed Blocks
- check Blocks
- Registry Modules
- Git Modules
- Module Versioning
- Workspaces
- Terraform Testing
- GitHub Actions
- Security Scanning
- CI/CD Best Practices

---

# 🚀 Capstone Project

The final project combines everything learned throughout TerraWeek into a production-inspired AWS infrastructure.

### Features

- Custom Terraform Module
- Official AWS Registry Module
- Remote Backend
- Native S3 Locking
- Multi-Environment Workspaces
- Terraform Test Framework
- GitHub Actions Pipeline
- Trivy Security Scan
- Version Pinning
- Production Folder Structure

---

# 📸 Repository Highlights

This repository contains:

- Terraform Configurations
- AWS Infrastructure Examples
- Module Development
- Terraform Testing
- GitHub Actions Workflow
- Trivy Security Reports
- Architecture Diagrams
- Screenshots
- Capstone Project
- Daily Documentation

---

# 📖 Learning Resources

- Terraform Documentation
- HashiCorp Learn
- Terraform Registry
- AWS Documentation
- TrainWithShubham TerraWeek Challenge

---

# 🎯 Key Takeaways

Through this challenge, I gained practical experience with:

- Infrastructure as Code (IaC)
- AWS Infrastructure Automation
- Reusable Terraform Modules
- Remote State Management
- Production Best Practices
- CI/CD Automation
- Terraform Testing
- Security Scanning
- Multi-Environment Infrastructure
- Cloud Infrastructure Design

This repository represents my continuous journey toward becoming a skilled **DevOps & Cloud Engineer** by applying modern Infrastructure as Code practices.

---

# 🤝 Connect With Me

If you're also participating in **#TerraWeekChallenge**, let's connect, collaborate, and continue learning together.

If you found this repository useful, consider giving it a ⭐.

Happy Terraforming! 🚀🌍

---


**#Terraform #AWS #DevOps #InfrastructureAsCode #IaC #CloudComputing #Automation #HashiCorp #GitHubActions #Trivy #CloudNative #LearningInPublic #Linux #GitHub #TerraWeekChallenge #TrainWithShubham**
