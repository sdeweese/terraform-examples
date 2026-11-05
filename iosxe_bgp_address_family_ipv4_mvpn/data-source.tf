# Read back the object after the matching resource has run.
data "iosxe_bgp_address_family_ipv4_mvpn" "example" {
  asn     = "65000"
  af_name = "mvpn"

  depends_on = [iosxe_bgp_address_family_ipv4_mvpn.example]
}
