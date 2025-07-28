# Nutanix Terraform Automation

This repository provides Terraform configurations to automate the provisioning of virtual machines (VMs) on a Nutanix cluster using the Nutanix Terraform provider.

## Purpose

The main goal of this Terraform project is to:
- Deploy a configurable number of VMs on a specified Nutanix cluster.
- Allow customization of VM resources (CPU, RAM, disk), network settings, and credentials.
- Support high-availability (HA) VM deployment with separate IP ranges.
- Use cloud-init for guest OS initialization (if `cloud-init.yml` is present).

## Features

- **Parameterization:** All key settings (cluster, subnet, VM specs, credentials, IP ranges) are defined as variables for easy customization.
- **Scalability:** Quickly adjust the number of standard and HA VMs to deploy.
- **Automation:** Consistent, repeatable VM provisioning on Nutanix infrastructure.

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.9.8 or newer
- Nutanix Prism Central endpoint, username, and password
- Access to a Nutanix cluster

### Setup Steps

1. **Clone the repository:**
   ```sh
   git clone <repo-url>
   cd Nutanix-Terraform-Automation
   ```

2. **Configure Variables:**
   - Edit `variables.tf` to set defaults, or
   - Create a `terraform.tfvars` file to override variables (recommended for sensitive data).

3. **Initialize Terraform:**
   ```sh
   terraform init
   ```

4. **Review and Apply:**
   ```sh
   terraform plan
   terraform apply
   ```

## Key Variables

- `prism_username`, `prism_password`, `prism_endpoint`: Nutanix Prism Central credentials and endpoint.
- `cluster_name`: Target Nutanix cluster.
- `subnet_name`: Subnet/VLAN for VMs.
- `vm_count`, `ha_vm_count`: Number of standard and HA VMs.
- `vm_prefix`: Prefix for VM names.
- `vm_cpu`, `vm_ram`, `vm_disk_size`: VM resource specs.
- `ip_range`, `vm_ip_start`, `ha_vm_ip_start`: Network configuration for VMs.
- `guest_username`, `guest_password`: Guest OS credentials.

See `variables.tf` for all available options and defaults.

## File Overview

- `main.tf`: Main Terraform configuration (resources, provider, logic).
- `variables.tf`: Input variable definitions.
- `outputs.tf`: Output values after apply.
- `cloud-init.yml`: (Optional) Cloud-init script for VM customization.
- `terraform.tfstate`, `terraform.tfstate.backup`: Terraform state files (do not edit manually).

## Security

- **Do not commit sensitive credentials** to version control.
- Use environment variables or a `.gitignore`d `terraform.tfvars` for secrets.

## License

This project is for internal automation and demonstration purposes. See Nutanix provider's LICENSE for provider terms.

---

*Automate Nutanix VM provisioning with Terraform for consistency and speed.*
