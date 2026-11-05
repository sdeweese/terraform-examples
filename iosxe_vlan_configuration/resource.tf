# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_vlan_configuration" "example" {
  vlan_id                  = "123"
  evpn_instance_legacy     = 123
  evpn_instance_vni_legacy = 10123
}
