# Read back the object after the matching resource has run.
data "iosxe_interface_tunnel" "example" {
  name = 90

  depends_on = [iosxe_interface_tunnel.example]
}
