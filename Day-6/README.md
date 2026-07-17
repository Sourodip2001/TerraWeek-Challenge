# 🚀 TerraWeek Day 06 — Advanced Terraform + Capstone Project

> **Advanced Terraform Concepts | Workspaces | Testing | Security Scanning | CI/CD | Best Practices | Capstone Project**

**Date:** Friday, 17th July 2026

---

# 📖 Overview

Welcome to **Day 06** of the **#TerraWeekChallenge**.

This project brings together everything learned throughout the challenge into a production-inspired Terraform project.

The objective was not just to provision AWS resources, but to implement modern Infrastructure as Code practices including reusable modules, environment isolation, testing, security scanning, automated CI/CD, and production-ready project organization.

---

# 🎯 Learning Objectives

During Day 06 I learned how to:

- Work with Terraform Workspaces
- Manage multiple environments
- Write native Terraform tests
- Perform security scanning using Trivy
- Automate Terraform using GitHub Actions
- Apply Terraform best practices
- Build a reusable infrastructure using modules
- Deploy a production-style Terraform project

---

# 📂 Project Structure

```
Day-6/
├── modules/
│   └── compute/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── tests/
│   └── web_server.tftest.hcl
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── .pre-commit-config.yaml
├── backend.tf
├── main.tf
├── outputs.tf
├── providers.tf
└── variables.tf
```

---

# 🛠️ Technologies Used

- Terraform v1.15.x
- AWS
- Amazon EC2
- Amazon S3
- Terraform Modules
- Terraform Workspaces
- Terraform Test Framework
- GitHub Actions
- Trivy
- Git
- GitHub

---

# 📚 Topics Covered

## Terraform Workspaces

- Workspace Isolation
- Environment Separation
- terraform.workspace
- Environment-specific Configuration

---

## Native Terraform Testing

Implemented Terraform's native testing framework.

Performed:

- Plan Tests
- Assertions
- Resource Validation
- Infrastructure Verification

---

## Security Scanning

Scanned Terraform configuration using:

- Trivy

Verified:

- Misconfigurations
- Security Risks
- Terraform Best Practices

---

## GitHub Actions

Implemented an automated Terraform pipeline.

Pipeline stages include:

- Checkout Repository
- Setup Terraform
- Terraform Format Check
- Terraform Init
- Terraform Validate
- Terraform Plan

---

## Production Best Practices

Implemented:

- Remote Backend
- State Locking
- Version Pinning
- Reusable Modules
- Variable Validation
- Output Management
- Consistent Tagging
- No Hardcoded Secrets
- Automated Validation
- Security Scanning

---

# 📦 Custom Module

Created a reusable **Compute Module** located at:

```
modules/
└── compute/
```

The module provisions AWS EC2 instances using configurable variables.

Module Features:

- Reusable
- Parameterized
- Validated Inputs
- Outputs
- Consistent Resource Tags

---

# 🌍 Environment Management

Used Terraform Workspaces to manage multiple environments.

Supported environments:

- Development
- Staging
- Production

Example:

```bash
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod
```

Different environments automatically use different instance sizes.

Example:

```hcl
locals {
  instance_type = terraform.workspace == "prod" ? "t3.medium" : "t3.micro"
}
```

---

# 🧪 Native Terraform Tests

Implemented native Terraform tests using:

```
tests/
└── web_server.tftest.hcl
```

The tests verify:

- Infrastructure Planning
- Resource Creation
- Resource Attributes
- Output Values

Run tests:

```bash
terraform test
```

---

# 🔐 Security Scan

Scanned the Terraform configuration using Trivy.

```bash
trivy config .
```

Benefits:

- Detect insecure configurations
- Improve infrastructure security
- Validate Terraform code before deployment

---

# ⚙️ GitHub Actions CI/CD

Implemented a complete Terraform CI/CD pipeline.

Workflow:

```
Git Push
      │
      ▼
GitHub Actions
      │
      ▼
terraform fmt
      │
      ▼
terraform init
      │
      ▼
terraform validate
      │
      ▼
terraform plan
```

This ensures every pull request is automatically validated before merging.

---

# 📋 Terraform Commands Used

## Initialize

```bash
terraform init
```

## Format

```bash
terraform fmt -recursive
```

## Validate

```bash
terraform validate
```

## Plan

```bash
terraform plan
```

## Apply

```bash
terraform apply
```

## Output

```bash
terraform output
```

## Test

```bash
terraform test
```

## Security Scan

```bash
trivy config .
```

## Destroy

```bash
terraform destroy
```

---

# 🏗️ Capstone Project

The capstone project combines all Terraform concepts learned throughout the TerraWeek Challenge into a single reusable infrastructure project.

Infrastructure includes:

- AWS EC2 Instance
- Custom Terraform Module
- Remote Backend
- Environment-specific Deployments
- Native Terraform Tests
- GitHub Actions Pipeline
- Security Scanning
- Modular Architecture

---

# 🍫 Bonus Tasks Completed

✔ Implemented Terraform Workspaces

✔ Created a reusable Compute Module

✔ Added variable validation

✔ Used Terraform native testing framework

✔ Configured GitHub Actions CI/CD

✔ Performed security scanning using Trivy

✔ Configured pre-commit hooks

✔ Followed Terraform production best practices

---

# 📌 Best Practices Followed

- Remote Backend for Terraform State
- State Locking
- Version Pinning
- Modular Infrastructure
- Reusable Components
- Environment Isolation
- Sensitive Variables
- No Hardcoded Secrets
- Automated Validation
- Automated Testing
- Security Scanning
- Infrastructure Documentation
- Clean Resource Destruction

---

# 📸 Screenshots

This project includes screenshots of:

- Terraform Init
- Terraform Plan
- Terraform Apply
- Terraform Test
- Trivy Scan
- GitHub Actions Workflow
- AWS Console
- Terraform Outputs
- Terraform Destroy

---

# 🚀 Outcome

By completing Day 06, I gained practical experience in designing production-ready Terraform infrastructure using modern DevOps practices.

Key achievements include:

- Modular Infrastructure Design
- Automated Infrastructure Validation
- Secure Terraform Workflows
- Environment Isolation
- Infrastructure Testing
- CI/CD Automation
- Security Scanning
- Production Best Practices

---

# 📖 References

- Terraform Documentation
- HashiCorp Learn
- Terraform Registry
- GitHub Actions Documentation
- Trivy Documentation
- AWS Documentation

---

# 🙏 Acknowledgements

Special thanks to **TrainWithShubham** for organizing the **TerraWeek Challenge**, providing practical hands-on exercises that strengthened my understanding of Infrastructure as Code and Terraform.

---

# 🎉 TerraWeek Challenge Completed

Successfully completed all six days of the TerraWeek Challenge and built a strong foundation in Terraform, Infrastructure as Code, reusable modules, state management, testing, security scanning, and CI/CD automation.

Looking forward to applying these concepts in real-world DevOps and Cloud projects.

---

## ⭐ If you found this project useful, consider giving the repository a Star!
