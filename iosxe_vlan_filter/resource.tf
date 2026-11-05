# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_vlan_filter" "example" {
  word       = "VAM1"
  vlan_lists = [1]
}
