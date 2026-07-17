output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "Identified resource reference ID of the provisioned VPC architecture"
}

output "instantiated_instances" {
  value       = { for k, v in module.compute_cluster : k => v.instance_public_ip }
  description = "Map tracking identifying addresses allocated to compute groups"
}