terraform {
  required_version = ">= 1.3.0"

  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
      # v1.x uses NETCONF only.
      version = "~> 1.1.1"
    }
  }
}

provider "iosxe" {
  # NETCONF uses SSH on port 830 by default.
  host     = var.switch_ip
  username = var.switch_username
  password = var.switch_password
}

variable "switch_ip" {
  description = "Target Cisco IOS XE switch IP address or hostname."
  type        = string
}

variable "vlan_id" {
  description = "An unused Layer 2 VLAN ID on the target switch."
  type        = number
}

variable "vlan_name" {
  description = "Name for the new Layer 2 VLAN."
  type        = string
}

variable "switch_username" {
  description = "Administrative username for NETCONF authentication."
  type        = string
  default     = "admin"
}

variable "switch_password" {
  description = "Administrative password for NETCONF authentication."
  type        = string
  sensitive   = true
}

# Create a Layer 2 VLAN only. This example does not configure an SVI,
# default gateway, or switchport membership.
resource "iosxe_vlan" "vlan_500" {
  vlan_id  = var.vlan_id
  name     = var.vlan_name
  shutdown = false
}

# Read the VLAN before and after the resource is applied. If the selected VLAN
# does not exist yet, the provider returns its ID with unset fields.
data "iosxe_vlan" "observed" {
  vlan_id = var.vlan_id
}

output "vlan_observed" {
  description = "VLAN values returned by the IOS XE data source."
  value = {
    vlan_id  = data.iosxe_vlan.observed.vlan_id
    name     = data.iosxe_vlan.observed.name
    shutdown = data.iosxe_vlan.observed.shutdown
  }
}
