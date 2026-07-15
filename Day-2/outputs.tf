output "container_name" {

  value = docker_container.web.name
}

output "container_id" {

  value = docker_container.web.id
}

output "environment" {

  value = var.environment
}

output "name_prefix" {

  value = local.name_prefix
}

output "merged_tags" {

  value = local.merged_tags
}

output "joined_users" {

  value = local.joined_users
}

output "upper_users" {

  value = local.upper_users
}

output "instance_type" {

  value = local.instance_type
}

output "total_regions" {

  value = local.total_regions
}
