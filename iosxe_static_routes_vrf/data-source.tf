# Read back the object after the matching resource has run.
data "iosxe_static_routes_vrf" "example" {
  vrf = "VRF1"

  depends_on = [iosxe_static_routes_vrf.example]
}
