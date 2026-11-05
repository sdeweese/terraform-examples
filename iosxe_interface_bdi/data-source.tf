# Read back the object after the matching resource has run.
data "iosxe_interface_bdi" "example" {
  name = "100"

  depends_on = [iosxe_interface_bdi.example]
}
