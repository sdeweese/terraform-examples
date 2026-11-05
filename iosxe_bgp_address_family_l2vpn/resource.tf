# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_bgp_address_family_l2vpn" "example" {
  asn                       = "65000"
  af_name                   = "evpn"
  rewrite_evpn_rt_asn       = true
  bgp_nexthop_trigger_delay = 10
}
