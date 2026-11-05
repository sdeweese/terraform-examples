# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_bgp_address_family_vpnv4" "example" {
  asn     = "65000"
  af_name = "unicast"
}
