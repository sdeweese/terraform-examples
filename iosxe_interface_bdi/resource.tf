# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_interface_bdi" "example" {
  name        = "100"
  mac_address = "0000.11AA.22BB"
  ip_mtu      = 1400
}
