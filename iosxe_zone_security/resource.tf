# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_zone_security" "example" {
  name        = "INSIDE"
  description = "Internal trusted network"
}
