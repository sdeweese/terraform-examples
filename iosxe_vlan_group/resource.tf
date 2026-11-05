# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_vlan_group" "example" {
  name       = "GROUP1"
  vlan_lists = [1]
}
