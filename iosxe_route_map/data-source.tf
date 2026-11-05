# Read back the object after the matching resource has run.
data "iosxe_route_map" "example" {
  name = "RM1"

  depends_on = [iosxe_route_map.example]
}
