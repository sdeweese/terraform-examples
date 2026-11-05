# Read back the object after the matching resource has run.
data "iosxe_bgp" "example" {
  asn = "65000"

  depends_on = [iosxe_bgp.example]
}
