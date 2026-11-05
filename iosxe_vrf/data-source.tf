# Read back the object after the matching resource has run.
data "iosxe_vrf" "example" {
  name = "VRF22"

  depends_on = [iosxe_vrf.example]
}
