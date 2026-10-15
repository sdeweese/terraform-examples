terraform {
  required_version = ">= 1.3.0"

  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "~> 0.15.0"
    }
  }
}

provider "iosxe" {
  alias    = "switch1"
  host     = var.switch1_host
  username = var.switch_username
  password = var.switch_password
}

provider "iosxe" {
  alias    = "switch2"
  host     = var.switch2_host
  username = var.switch_username
  password = var.switch_password
}
