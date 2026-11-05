# Read back the object after the matching resource has run.
data "iosxe_interface_ospf" "example" {
  type = "Loopback"
  name = "1"

  depends_on = [iosxe_interface_ospf.example]
}
