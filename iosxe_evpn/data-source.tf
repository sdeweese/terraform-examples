# Read back the object after the matching resource has run.
data "iosxe_evpn" "example" {

  depends_on = [iosxe_evpn.example]
}
