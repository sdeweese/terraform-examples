# Read back the object after the matching resource has run.
data "iosxe_interface_pim" "example" {
  type = "Loopback"
  name = "100"

  depends_on = [iosxe_interface_pim.example]
}
