# Read back the object after the matching resource has run.
data "iosxe_radius_server" "example" {

  depends_on = [iosxe_radius_server.example]
}
