# Configure the Nutanix Provider
terraform {
  required_providers {
    nutanix = {
      source = "nutanix/nutanix"
      version = "1.9.5"
    }
  }
}

provider "nutanix" {
  username     = var.prism_username
  password     = var.prism_password
  endpoint     = var.prism_endpoint
  insecure     = true
  wait_timeout = 60
}

# Fetch cluster information
data "nutanix_cluster" "cluster" {
  name = var.cluster_name
}

# Fetch subnet information
data "nutanix_subnets" "subnets" {}

locals {
  subnet = [
    for s in data.nutanix_subnets.subnets.entities :
    s if s.name == var.subnet_name
  ][0]
}

# Use existing Rocky Linux image
data "nutanix_image" "rocky_linux" {
  image_name = "Rocky-9.4-Cloud"
}

# Create VMs
resource "nutanix_virtual_machine" "vm" {
  count                = var.vm_count
  name                 = "${var.vm_prefix}${count.index + 1}"
  cluster_uuid         = data.nutanix_cluster.cluster.id
  num_vcpus_per_socket = var.vm_cpu
  num_sockets          = 1
  memory_size_mib      = var.vm_ram * 1024

  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = data.nutanix_image.rocky_linux.id
    }
    device_properties {
      disk_address = {
        device_index = 0
        adapter_type = "SCSI"
      }
      device_type = "DISK"
    }
    disk_size_mib = var.vm_disk_size * 1024
  }

  nic_list {
    subnet_uuid = local.subnet.metadata.uuid
  }

guest_customization_cloud_init_user_data = base64encode(templatefile("${path.module}/cloud-init.yml", {
  hostname   = "${var.vm_prefix}${count.index + 1}"
  username   = var.guest_username
  password   = var.guest_password
  ip_address = "172.16.90.${count.index + 131}"  # Adjusting IP addresses
  gateway    = "172.16.90.254"
}))
}