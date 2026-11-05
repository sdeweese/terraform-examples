terraform {
  required_version = ">= 1.3.0"

  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
      # NETCONF became the default protocol in 0.15.0.
      version = "~> 0.15.0"
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
