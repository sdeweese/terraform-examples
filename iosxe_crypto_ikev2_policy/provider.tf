terraform {
  required_version = ">= 1.3.0"

  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "~> 1.1.1"
    }
  }
}

provider "iosxe" {
  host     = var.switch_ip
  username = var.switch_username
  password = var.switch_password
}
