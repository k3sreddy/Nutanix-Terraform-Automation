variable "prism_username" {
  description = "Prism username"
  default     = "nutanix"
}

variable "prism_password" {
  description = "Prism password"
  default     = "nutanix123?"
}

variable "prism_endpoint" {
  description = "Prism Central IP"
  default     = "192.168.25.120"
}

variable "cluster_name" {
  description = "Nutanix cluster name"
  default     = "ICSCLUSTER-01"
}

variable "subnet_name" {
  description = "Subnet name/VLAN ID/VPC"
  default     = "VLAN_0_br0"
}

variable "vm_count" {
  description = "Number of VMs to create"
  default     = 10
}

variable "vm_prefix" {
  description = "Prefix for VM names"
  default     = "TVM-"
}

variable "vm_cpu" {
  description = "Number of vCPUs per VM"
  default     = 8
}

variable "vm_ram" {
  description = "Amount of RAM in GB per VM"
  default     = 8
}

variable "vm_disk_size" {
  description = "Disk size in GB for each VM"
  default     = 50
}

variable "guest_username" {
  description = "Guest OS username"
  default     = "root"
}

variable "guest_password" {
  description = "Guest OS password"
  default     = "unroot"
}

variable "ip_range" {
  description = "IP range for VMs"
  default     = "172.16.90.0/24"
}

variable "vm_ip_start" {
  description = "Starting IP address for VMs"
  default     = "172.16.90.131"
}

variable "ha_vm_count" {
  description = "Number of HA VMs to create"
  default     = 2
}

variable "ha_vm_ip_start" {
  description = "Starting IP address for HA VMs"
  default     = "172.16.90.139"
}
