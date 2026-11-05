# Read back the object after the matching resource has run.
data "iosxe_bgp_address_family_ipv6_vrf" "example" {
  asn     = "65000"
  af_name = "unicast"

  depends_on = [iosxe_bgp_address_family_ipv6_vrf.example]
}
