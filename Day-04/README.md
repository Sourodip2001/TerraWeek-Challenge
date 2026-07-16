# 🚀 TerraWeek Challenge – Day 04
## Terraform State & Remote Backends (Native Locking)


---

# 📖 Introduction

Day 4 focused on one of the most important Terraform concepts—**Terraform State**.

Terraform state acts as the source of truth for your infrastructure, allowing Terraform to understand what resources it manages and what changes need to be made.

In this challenge, I explored:

- Terraform State
- State Commands
- Remote Backends
- AWS S3 Backend
- Native State Locking
- Import Existing Resources
- Terraform Refactoring Blocks

---

# 🎯 Learning Objectives

By the end of Day 4 I was able to:

- Understand Terraform State
- Explore Terraform State Commands
- Configure Remote State using AWS S3
- Enable Native S3 State Locking
- Import Existing Resources
- Compare Remote Backends
- Understand State Security
- Learn Terraform Refactoring Blocks

---

# 📚 Task 1 – Understanding Terraform State

## What is terraform.tfstate?

`terraform.tfstate` is a JSON file created by Terraform that stores information about all infrastructure resources managed by Terraform.

It contains:

- Resource IDs
- Metadata
- Dependencies
- Output Values
- Current Infrastructure State

Terraform compares this file with your configuration to determine what changes need to be applied.

---

## Why should you never edit terraform.tfstate manually?

Editing the state file manually may:

- Corrupt Terraform State
- Break Resource Mapping
- Cause Infrastructure Drift
- Lead to Unexpected Resource Recreation

Terraform provides dedicated `terraform state` commands to safely modify state.

---

## Why should you never commit terraform.tfstate to Git?

The state file may contain sensitive information such as:

- Database Passwords
- Access Keys
- Secret Values
- IAM Resource Details
- Infrastructure Metadata

Always add the following to `.gitignore`:

```gitignore
terraform.tfstate
terraform.tfstate.*
```

---

## What is State Drift?

State Drift occurs when infrastructure is modified outside Terraform.

Example:

- Create an S3 bucket using Terraform.
- Delete the bucket manually in AWS Console.
- Terraform State still believes the bucket exists.

Terraform detects drift using:

```bash
terraform plan
```

Terraform can also refresh the state using:

```bash
terraform refresh
```

> **Note:** In modern Terraform versions, `terraform refresh` has largely been superseded by the refresh that happens automatically during `terraform plan` and `terraform apply`.

---

## Why is State Sensitive?

Terraform State may contain:

- Passwords
- Secrets
- Connection Strings
- Resource IDs
- Infrastructure Metadata

For production workloads:

- Encrypt state
- Store state remotely
- Restrict access using IAM
- Enable bucket versioning

---

# 📚 Task 2 – Terraform State Commands

## List Resources

```bash
terraform state list
```

Lists all resources managed by Terraform.

---

## Show Resource

```bash
terraform state show aws_s3_bucket.demo
```

Displays detailed information about a specific resource.

---

## Move Resource

```bash
terraform state mv aws_s3_bucket.demo aws_s3_bucket.production
```

Renames or moves a resource within Terraform State without recreating it.

---

## Remove Resource

```bash
terraform state rm aws_s3_bucket.production
```

Stops Terraform from managing the resource without deleting it.

---

## Display Current State

```bash
terraform show
```

Shows the current infrastructure in a human-readable format.

---

# 📚 Task 3 – Bootstrap Backend Infrastructure

Before configuring a remote backend, the S3 bucket must already exist.

The backend infrastructure was created using local state.

## Commands

```bash
cd backend_infra

terraform init

terraform fmt

terraform validate

terraform plan

terraform apply
```

Resources created:

- AWS S3 Bucket
- Bucket Versioning
- Server-Side Encryption

---

# 📚 Task 4 – Configure Remote Backend

Configured Terraform to use AWS S3 as the remote backend.

```hcl
terraform {

  backend "s3" {

    bucket = "your-unique-bucket"

    key = "day04/terraform.tfstate"

    region = "us-east-1"

    encrypt = true

    use_lockfile = true

  }

}
```

## Why use `use_lockfile`?

Starting with newer Terraform versions, native S3 locking replaces the older DynamoDB-based locking mechanism.

Benefits:

- No DynamoDB Table Required
- Simpler Configuration
- Native AWS S3 Locking
- Prevents Concurrent Terraform Runs

---

## Initialize Backend

```bash
terraform init
```

Terraform migrates the local state to the remote S3 backend.

---

## Verify Backend

After initialization:

- `terraform.tfstate` is uploaded to S3.
- A `.tflock` file appears during Terraform operations and is automatically removed when the operation completes.

---

# 📚 Task 5 – Import Existing Resources

Terraform can import existing infrastructure without recreating it.

Example:

```hcl
import {

  to = aws_s3_bucket.imported

  id = "my-existing-bucket"

}
```

Generate Terraform configuration:

```bash
terraform plan -generate-config-out=generated.tf
```

Terraform generates resource configuration automatically.

---

# 🍫 Bonus Tasks

## Compare Remote Backends

| Backend | Advantages | Best Use Case |
|----------|------------|---------------|
| AWS S3 | Native locking, encryption, versioning | AWS environments |
| HCP Terraform | Collaboration, remote execution, policy enforcement | Enterprise teams |
| Azure Storage | Azure-native backend | Azure workloads |
| Google Cloud Storage | IAM integration, versioning | Google Cloud environments |

---

## Enable Bucket Versioning

Bucket versioning protects Terraform State by allowing recovery of previous versions.

Benefits:

- Recover deleted state
- Restore previous versions
- Protect against accidental overwrites

---

## moved Block

```hcl
moved {

  from = aws_s3_bucket.demo

  to = aws_s3_bucket.production

}
```

Moves resources in Terraform State without destroying infrastructure.

---

## removed Block

```hcl
removed {

  from = aws_s3_bucket.production

}
```

Stops Terraform from managing a resource while leaving the infrastructure intact.

---

## check Block

```hcl
check "bucket_name_check" {

  assert {

    condition = length(var.bucket_name) > 5

    error_message = "Bucket name is too short."

  }

}
```

Ensures configuration health before deployment.

---

# 📂 Project Structure

```
Day-04/
│
├── README.md
├── .gitignore
│
├── backend_infra/
│   ├── provider.tf
│   ├── terraform.tf
│   ├── variables.tf
│   ├── s3.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── backend_demo/
│   ├── backend.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   ├── import.tf
│   ├── moved.tf
│   ├── removed.tf
│   └── check.tf
│
└── screenshots/
```

---

# 🛠 Commands Used

## Bootstrap Infrastructure

```bash
cd backend_infra

terraform init

terraform fmt

terraform validate

terraform plan

terraform apply
```

---

## Configure Remote Backend

```bash
cd ../backend_demo

terraform init

terraform plan

terraform apply

terraform output
```

---

## Terraform State Commands

```bash
terraform state list

terraform state show aws_s3_bucket.demo

terraform show

terraform state mv aws_s3_bucket.demo aws_s3_bucket.production

terraform state rm aws_s3_bucket.production
```

---

## Import Existing Resource

```bash
terraform plan -generate-config-out=generated.tf

terraform apply
```

---

## Cleanup

```bash
cd backend_demo

terraform destroy

cd ../backend_infra

terraform destroy
```

---

# 📌 Key Takeaways

- Terraform State is the foundation of Infrastructure as Code.
- Remote state enables safe collaboration across teams.
- Native S3 State Locking eliminates the need for DynamoDB.
- State files should never be committed to Git repositories.
- Terraform State may contain sensitive information and must be secured.
- Refactoring blocks (`moved`, `removed`, `check`) make infrastructure changes safer and easier to manage.
- Import blocks simplify adopting existing infrastructure into Terraform.

---

# 🎯 Outcome

Successfully completed **TerraWeek Challenge – Day 04**, gaining practical experience with **Terraform State Management**, **AWS S3 Remote Backends**, **Native S3 State Locking**, **State Commands**, **Import Blocks**, and modern Terraform refactoring features. These concepts are essential for building secure, collaborative, and production-ready Infrastructure as Code workflows.
#TerraWeekChallenge #TrainWithShubham #Terraform #InfrastructureAsCode #IaC #AWS #AmazonS3 #DevOps #CloudComputing #Automation #HashiCorp #LearningInPublic #CloudNative #GitHub
