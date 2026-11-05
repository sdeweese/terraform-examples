# Read back the object after the matching resource has run.
data "iosxe_radius" "example" {
  name = "radius_10.10.15.12"

  depends_on = [iosxe_radius.example]
}
