output "web_public_ip" {
  value       = module.web_server.public_ip
  description = "Public IP address of the single web server"
}

output "multi_instance_private_ips" {
  value       = { for k, v in module.servers : k => v.private_ip }
  description = "Private IP addresses mapped to each server inside the loop"
}