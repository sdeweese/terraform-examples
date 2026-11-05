# Read back the object after the matching resource has run.
data "iosxe_eigrp_vrf" "example" {
  name = "TOPGEN"
  vrf  = "VRF1"

  depends_on = [iosxe_eigrp_vrf.example]
}
