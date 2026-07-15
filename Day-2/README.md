````markdown
# 🚀 TerraWeek Challenge – Day 02
## HCL Deep Dive: Variables, Types & Expressions

**Date:** Monday, 13th July 2026

---

# 📖 Introduction

Day 2 of the TerraWeek Challenge focused on mastering **HashiCorp Configuration Language (HCL)**, the language used to write Terraform configurations.

The objective was to understand how Terraform configurations become reusable, flexible, and maintainable using variables, expressions, locals, outputs, validation, and built-in functions.

---

# 🎯 Learning Objectives

By completing Day 2, I learned:

- Understand HCL syntax and structure
- Differentiate between blocks and arguments
- Work with Terraform expressions
- Create and validate input variables
- Use all major Terraform variable types
- Implement locals and outputs
- Explore Terraform built-in functions
- Understand variable precedence
- Practice using terraform console

---

# 📚 Task 1 – Understanding HCL Syntax

## What is HCL?

HashiCorp Configuration Language (HCL) is a human-readable language used to define infrastructure in Terraform.

Example:

```hcl
resource "local_file" "example" {
  filename = "hello.txt"
  content  = "Hello TerraWeek!"
}
```

---

## Anatomy of a Block

General syntax

```hcl
block_type "label1" "label2" {

  argument = value

}
```

Example

```hcl
resource "local_file" "example" {

  filename = "hello.txt"

  content = "Hello Terraform"
}
```

- **Block Type** → resource
- **Label 1** → local_file
- **Label 2** → example

---

## Arguments

Arguments assign values inside a block.

Example

```hcl
filename = "hello.txt"
```

---

## Blocks

Blocks create infrastructure or define configurations.

Example

```hcl
resource "local_file" "example" {

}
```

---

## Expressions

### String Interpolation

```hcl
"${var.environment}-server"
```

---

### Reference Expression

```hcl
var.container_name
```

---

### Operators

```hcl
var.environment == "prod"
```

---

# 📚 Task 2 – Variables, Types & Validation

Terraform supports different variable types.

---

## String

```hcl
variable "container_name" {

  type = string

  default = "terraweek-nginx"
}
```

---

## Number

```hcl
variable "external_port" {

  type = number

  default = 8080
}
```

---

## Boolean

```hcl
variable "enable_logs" {

  type = bool

  default = true
}
```

---

## List

```hcl
variable "allowed_users" {

  type = list(string)

  default = [
    "Alice",
    "Bob",
    "Charlie"
  ]
}
```

---

## Map

```hcl
variable "common_tags" {

  type = map(string)

  default = {

    Project = "TerraWeek"

    Owner = "Sourodip"
  }
}
```

---

## Set

```hcl
variable "regions" {

  type = set(string)

  default = [
    "ap-south-1",
    "us-east-1"
  ]
}
```

---

## Object

```hcl
variable "vm_config" {

  type = object({

    cpu = number

    memory = number

    os = string

  })

  default = {

    cpu = 2

    memory = 2048

    os = "Ubuntu"

  }
}
```

---

## Tuple

```hcl
variable "server_tuple" {

  type = tuple([
    string,
    number,
    bool
  ])

  default = [
    "nginx",
    80,
    true
  ]
}
```

---

## Validation

```hcl
variable "environment" {

  type = string

  default = "dev"

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

## Sensitive Variable

```hcl
variable "db_password" {

  type = string

  sensitive = true
}
```

---

# 📚 Task 3 – Locals

Locals help avoid repeating values.

Example

```hcl
locals {

  name_prefix = upper("${var.environment}-terraweek")

  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
}
```

---

# Outputs

Outputs display useful information after deployment.

```hcl
output "environment" {

  value = var.environment
}

output "instance_type" {

  value = local.instance_type
}
```

---

# Terraform Built-in Functions

## upper()

```terraform
upper("terraweek")
```

Output

```
"TERRAWEEK"
```

---

## join()

```terraform
join("-", ["tws","terraform","2026"])
```

Output

```
tws-terraform-2026
```

---

## merge()

```terraform
merge(
{
Project="Terraform"
},
{
Owner="Sourodip"
}
)
```

Output

```
{
Project = Terraform
Owner = Sourodip
}
```

---

## lookup()

```terraform
lookup(
{
Name="Sourodip"
},
"Name"
)
```

Output

```
Sourodip
```

---

## length()

```terraform
length([
"AWS",
"Docker",
"Terraform"
])
```

Output

```
3
```

---

## format()

```terraform
format("%s-%s","dev","nginx")
```

Output

```
dev-nginx
```

---

# Terraform Console

```bash
terraform console
```

Examples

```terraform
upper("terraweek")

join("-", ["Terraform","Day","02"])

length(["AWS","Docker","Terraform"])

lookup(
{
Name="Sourodip"
},
"Name"
)
```

Exit console

```terraform
exit
```

---

# 📚 Task 4 – Terraform Workflow

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

Apply

```bash
terraform apply
```

Display outputs

```bash
terraform output
```

Destroy resources

```bash
terraform destroy
```

---

# Using terraform.tfvars

Instead of passing variables using `-var`, Terraform automatically loads values from `terraform.tfvars`.

Example

```hcl
container_name = "tws-web"

external_port = 8080

environment = "dev"
```

Run

```bash
terraform plan

terraform apply
```

---

# Variable Precedence

Highest precedence wins.

```
-var / -var-file
        ↓
*.auto.tfvars
        ↓
terraform.tfvars
        ↓
TF_VAR_ Environment Variables
        ↓
Default Values
```

---

# 🍫 Bonus Tasks

## For Expression

```hcl
locals {

  upper_users = [

    for user in var.allowed_users :

    upper(user)
  ]
}
```

---

## Conditional Expression

```hcl
locals {

  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
}
```

---

## Optional Object Attribute

```hcl
variable "employee" {

  type = object({

    name = string

    age = number

    designation = optional(
      string,
      "DevOps Engineer"
    )
  })

  default = {

    name = "Sourodip"

    age = 25
  }
}
```

---

# 📂 Project Structure

```
Day-02/
│
├── terraform.tf
├── variables.tf
├── main.tf
├── locals.tf
├── outputs.tf
├── terraform.tfvars
└── README.md
```

---

# 📌 Key Takeaways

- Learned the fundamentals of HCL.
- Explored blocks, arguments, and expressions.
- Implemented all major Terraform variable types.
- Added variable validation and sensitive variables.
- Used locals to simplify configurations.
- Displayed useful outputs.
- Practiced Terraform built-in functions.
- Understood variable precedence.
- Implemented for expressions and conditional expressions.
- Explored optional object attributes.

---

# 🚀 Commands Used

```bash
terraform version

terraform fmt

terraform validate

terraform init

terraform console

terraform plan

terraform apply

terraform output

terraform destroy
```

---

# 🎯 Outcome

Successfully completed **TerraWeek Day 02**, gaining hands-on experience with **HashiCorp Configuration Language (HCL)**, Terraform variables, expressions, validation, locals, outputs, functions, and advanced language features. These concepts form the foundation for writing scalable, reusable, and production-ready Infrastructure as Code.
````
#TerraWeekChallenge #TrainWithShubham #Terraform #InfrastructureAsCode #IaC #DevOps #CloudComputing #AWS #Automation #OpenTofu #HashiCorp #GitHub #LearningInPublic #DevOpsJourney #CloudNative #Linux #TechCommunity
