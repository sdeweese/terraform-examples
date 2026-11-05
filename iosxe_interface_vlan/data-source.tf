# Read back the object after the matching resource has run.
data "iosxe_interface_vlan" "example" {
  name = 10

  depends_on = [iosxe_interface_vlan.example]
}
