# Read back the object after the matching resource has run.
data "iosxe_bgp_address_family_l2vpn" "example" {
  asn     = "65000"
  af_name = "evpn"

  depends_on = [iosxe_bgp_address_family_l2vpn.example]
}
