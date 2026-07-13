output "container_id" {
  description = "The unique cryptographic identifier of the provisioned container"
  value       = docker_container.web.id
}

output "container_name" {
  description = "The system-calculated HCL runtime name of the active container"
  value       = docker_container.web.name
}

output "application_url" {
  description = "Direct local ingress verification address"
  value       = "http://localhost:8080"
}

output "transformed_names_preview" {
  description = "Demonstration of the processed HCL 'for' expression loop output"
  value       = local.transformed_names
}