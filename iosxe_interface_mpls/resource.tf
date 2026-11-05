# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_interface_mpls" "example" {
  type = "Loopback"
  name = "1"
  ip   = true
  mtu  = "1200"
}
