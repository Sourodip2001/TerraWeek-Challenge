# EC2 Instance Child Module

A minimal, reusable EC2 instance module that standardizes instance tags and forces input verification.

## Requirements
* Terraform >= 1.0
* AWS Provider

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Logical name used in tags | string | n/a | yes |
| ami | Valid AMI ID (`ami-xxxx`) | string | n/a | yes |
| subnet_id | Target subnet ID | string | n/a | yes |
| vpc_security_group_ids | Target SG list | list(string) | n/a | yes |
| instance_type | Instance class size | string | `t2.micro` | no |
| environment | Environment target (`dev`/`staging`/`prod`) | string | `dev` | no |
| tags | Custom map tags | map(string) | `{}` | no |