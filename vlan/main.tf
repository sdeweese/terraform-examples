terraform {
  required_version = ">= 1.3.0"

  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
      # Provider v1.0.0 and later use NETCONF only; RESTCONF support was removed.
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
  vlan_id  = 500
  name     = "VLAN_500"
  shutdown = false
}

# Read the live VLAN after it exists on the switch. Terraform reads this data
# source during plan/apply, so run a fresh plan after applying the resource to
# observe the updated values.
data "iosxe_vlan" "vlan_500" {
  vlan_id = 500
}

output "vlan_500_observed" {
  description = "Current VLAN 500 values read from the switch."
  value = {
    vlan_id  = data.iosxe_vlan.vlan_500.vlan_id
    name     = data.iosxe_vlan.vlan_500.name
    shutdown = data.iosxe_vlan.vlan_500.shutdown
  }
}
