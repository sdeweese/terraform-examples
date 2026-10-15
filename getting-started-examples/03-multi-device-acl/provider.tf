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
  alias    = "switch5"
  host     = var.switch5_host
  username = var.switch_username
  password = var.switch_password
}

provider "iosxe" {
  alias    = "switch55"
  host     = var.switch55_host
  username = var.switch_username
  password = var.switch_password
}
