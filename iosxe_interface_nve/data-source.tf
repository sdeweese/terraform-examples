# Read back the object after the matching resource has run.
data "iosxe_interface_nve" "example" {
  name = 1

  depends_on = [iosxe_interface_nve.example]
}
