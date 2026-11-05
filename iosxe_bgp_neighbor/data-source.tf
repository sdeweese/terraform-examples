# Read back the object after the matching resource has run.
data "iosxe_bgp_neighbor" "example" {
  asn = "65000"
  ip  = "3.3.3.3"

  depends_on = [iosxe_bgp_neighbor.example]
}
