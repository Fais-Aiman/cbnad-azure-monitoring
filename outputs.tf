output "resource_group_name" {
  description = "Resource group name."
  value       = module.resource_group.resource_group_name
}

output "public_ip_address" {
  description = "VM public IP address."
  value       = module.network.public_ip_address
}

output "private_ip_address" {
  description = "VM private IP address."
  value       = module.network.vm_private_ip
}

output "ssh_command" {
  description = "SSH command for connecting to the VM."
  value       = "ssh ${var.admin_username}@${module.network.public_ip_address}"
}

output "grafana_url" {
  description = "Grafana URL."
  value       = "http://${module.network.public_ip_address}:3000"
}

output "prometheus_url" {
  description = "Prometheus URL."
  value       = "http://${module.network.public_ip_address}:9090"
}