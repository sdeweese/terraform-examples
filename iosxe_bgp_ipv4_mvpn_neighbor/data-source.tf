# Read back the object after the matching resource has run.
data "iosxe_bgp_ipv4_mvpn_neighbor" "example" {
  asn = "65000"
  ip  = "172.16.255.4"

  depends_on = [iosxe_bgp_ipv4_mvpn_neighbor.example]
}
