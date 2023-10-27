#
# vCenter
#
variable "vcenter_server" {
  description = "vCenter Server hostname or IP"
  type = string
}

variable "vcenter_user" {
  description = "vCenter Server username"
  type = string
}

variable "vcenter_password" {
  description = "vCenter Server password"
  type = string
}

variable "vcenter_insecure_ssl" {
  description = "Allow insecure connection to the vCenter server (unverified SSL certificate)"
  type = bool
  default = false
}

#
# vSphere
#
variable "vsphere_datacenter" {
  description = "vsphere datacenter name"
  type = string
}

variable "vsphere_compute_cluster" {
  description = "vsphere compute cluster name"
  type = string
}

variable "vsphere_datastore_name" {
  description = "vsphere datastore name"
  type = string
}

variable "vsphere_resource_pool_name" {
  description = "vsphere resource pool name"
  type = string
}

variable "vsphere_networks" {
  type = list(object({
    name = string
    ovf_mapping = string
  }))
}

variable "vsphere_content_library_name" {
  description = "content library name"
  type = string
}

variable "vsphere_content_library_description" {
  description = "content library description"
  type = string
  default = "A new source of content"
}

variable "vsphere_content_library_item_name" {
  description = "name of the content library template"
  type = string
  default = "template"
}

variable "vsphere_content_library_item_description" {
  description = "description of the content library template"
  type = string
  default = "Template for terraform automation"
}

variable "vsphere_content_library_item_file_url" {
  description = "template url"
  type = string
}

#
# SSH
#
variable "rsa_private_key_file" {
  description = "RSA private key file"
  type = string
  default = "~/.ssh/id_rsa"
}

variable "rsa_public_key_file" {
  description = "RSA public key file"
  type = string
  default = "~/.ssh/id_rsa.pub"
}

#
# Cloud Init
#
variable "cloud_init_username" {
  description = "username for the user on the linux system"
  type = string
  default = "vmware"
}

variable "cloud_init_password" {
  description = "password for the user on the linux system"
  type = string
  default = "P@ssword123!"
}

variable "cloud_init_primary_group" {
  description = "primary group for the user on the linux system"
  type = string
  default = "vmware"
}

variable "cloud_init_groups" {
  description = "comma separated list of groups for the user on the linux system"
  type = string
  default = "wheel"
}

variable "cloud_init_user_shell" {
  description = "user shell"
  type = string
  default = "/bin/bash"
}

#
# VM
#
variable "vm_name_prefix" {
  description = "vm name prefix"
  type = string
  default = "kafka"
}

variable "vm_firmware" {
  description = "firmware for the vm efi/bios"
  type = string
  default = "efi"

  validation {
    condition = var.vm_firmware == "bios" || var.vm_firmware == "efi"
    error_message = "Variable vm_firmware must be 'bios' or 'efi'."
  }
}

variable "vm_hardware_version" {
  description = "vSphere hardware hardware version"
  type = string
  default = 19

  validation {
    condition = var.vm_hardware_version >= 3 && var.vm_hardware_version <= 20
    error_message = "Variable vm_hardware_version must be between 3 and 20."
  }
}

variable "vm_network_ipv4_ips" {
  type = list(list(object({
      ipv4_address = string
      ipv4_netmask = string
    })))
}

variable "vm_network_ipv4_gateway" {
  description = "ipv4 gateway"
  type = string
}

variable "vm_network_ipv4_dns_servers" {
  description = "DNS ip list"
  type = list(string)
}

variable "vm_network_domain" {
  description = "Domain name"
  type = string
}

#
# Kendryl VM
#
variable kendryl_vm_count {
  description = "Number of Kendryl VM"
  type = number
  default = 4
}

variable kendryl_cpu_count {
  description = "Number of Kendryl VM vCPU"
  type = number
  default = 8
}

variable kendryl_memory_gb {
  description = "Amount of Kendryl VM Memory in GB"
  type = number
  default = 64
}

variable kendryl_os_disk_gb {
  description = "Size of Kendryl VM OS Disk in GB"
  type = number
  default = 300
}

variable kendryl_data_disk_gb {
  description = "Size of Kendryl VM Data Disk(s) in GB"
  type = number
  default = 1024
}

variable kendryl_data_disk_count {
  description = "Number of Kendryl VM Data Disks"
  type = number
  default = 1
}

#
# Inventory
#
variable "output_folder" {
  type = string
  description = "The path to use when saving the rendered inventory file."
}