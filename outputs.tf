output "vm_names" {
  description = "Names of the created regular VMs"
  value       = nutanix_virtual_machine.vm[*].name
}

output "vm_ip_addresses" {
  description = "IP addresses of the created regular VMs"
  value       = [for i in range(var.vm_count) : "172.16.90.${i + 131}"]
}

output "subnet_name" {
  description = "Name of the subnet used"
  value       = local.subnet.name
}

output "cluster_name" {
  description = "Name of the Nutanix cluster"
  value       = var.cluster_name
}
