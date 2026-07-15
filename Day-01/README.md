# 🚀 TerraWeek Challenge - Day 01
## Introduction to IaC & Terraform Basics


---

# Task 1 - Infrastructure as Code (IaC)

## What is Infrastructure as Code?

Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure using code instead of manually configuring resources through a cloud console.

### Problems solved by IaC

- Eliminates manual configuration errors
- Infrastructure becomes reproducible
- Version controlled using Git
- Enables automation
- Faster deployments
- Easy rollback
- Consistent environments

---

# What is Terraform?

Terraform is an open-source Infrastructure as Code tool developed by HashiCorp.

It allows developers and DevOps engineers to define infrastructure using declarative configuration files (HCL).

Terraform automatically determines the execution plan and creates, updates or destroys infrastructure safely.

### Why Terraform is popular

- Declarative syntax
- Multi-cloud support
- Provider based architecture
- Huge community
- State management
- Modular design
- Open source

---

# Terraform vs Alternatives

## Terraform

Declarative, provider-based, works across almost every cloud platform.

## OpenTofu

Community-driven open-source fork of Terraform that remains fully open after HashiCorp's license change.

## Pulumi

Uses programming languages like Python, Go, JavaScript and C# instead of HCL.

## CloudFormation

AWS-native IaC service that only manages AWS resources.

## Ansible

Configuration management and automation tool that focuses on software installation and server configuration rather than infrastructure provisioning.

---

# Task 2 - Terraform Installation

## Install Terraform

Ubuntu

```bash
sudo apt update

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com \
$(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt install terraform
```

Verify Installation

```bash
terraform version
```

Example Output

```text
Terraform v1.15.x
```

Help

```bash
terraform -help
```

Install VS Code Extension

```
HashiCorp Terraform
```

---

# Task 3 - Six Terraform Terminologies

## Provider

Plugin that lets Terraform communicate with external platforms.

Example

```hcl
provider "local" {}
```

---

## Resource

Represents an infrastructure object managed by Terraform.

Example

```hcl
resource "local_file" "hello" {}
```

---

## State

Stores information about infrastructure managed by Terraform.

Example

```
terraform.tfstate
```

---

## Plan

Preview of infrastructure changes before applying them.

Command

```bash
terraform plan
```

---

## HCL

HashiCorp Configuration Language used for writing Terraform code.

Example

```hcl
resource "random_pet" "name" {}
```

---

## Module

Reusable collection of Terraform configuration files.

Example

```hcl
module "network" {
  source="./modules/network"
}
```

---

# Task 4 - Terraform Workflow

Go inside the example directory

```bash
cd example
```

Initialize Terraform

```bash
terraform init
```

Format code

```bash
terraform fmt
```

Validate

```bash
terraform validate
```

Preview

```bash
terraform plan
```

Create Resources

```bash
terraform apply
```

Type

```
yes
```

View Generated File

```bash
cat greeting.txt
```

Destroy Infrastructure

```bash
terraform destroy
```

Type

```
yes
```

---

# Terraform Workflow

```
Write
   ↓
Init
   ↓
Plan
   ↓
Apply
   ↓
Destroy
```

---

# Bonus Task

## Enable CLI Auto-completion

```bash
terraform -install-autocomplete
```

Restart terminal.

---

## Install OpenTofu

```bash
sudo apt install opentofu
```

Check version

```bash
tofu version
```

Difference

- OpenTofu is community driven
- 100% open source
- Compatible with Terraform configuration

---

## What is .terraform.lock.hcl?

It records the exact provider versions and checksums used by Terraform.

Benefits

- Consistent provider versions
- Secure downloads
- Reproducible builds
- Team consistency

---

# Commands Used

```bash
terraform version

terraform -help

terraform init

terraform fmt

terraform validate

terraform plan

terraform apply

cat greeting.txt

terraform destroy

terraform -install-autocomplete
```

---

# Learning Outcome

Today I learned

- Infrastructure as Code
- Terraform basics
- Terraform workflow
- Providers
- Resources
- State management
- HCL
- Modules
- Terraform CLI
- OpenTofu
- Lock files
#TerraWeekChallenge #TrainWithShubham #Terraform #AWS #DevOps #InfrastructureAsCode #CloudComputing #OpenSource #LearningInPublic
