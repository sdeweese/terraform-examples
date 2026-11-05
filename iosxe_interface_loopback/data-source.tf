# Read back the object after the matching resource has run.
data "iosxe_interface_loopback" "example" {
  name = 201

  depends_on = [iosxe_interface_loopback.example]
}
