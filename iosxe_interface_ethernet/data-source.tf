# Read back the object after the matching resource has run.
data "iosxe_interface_ethernet" "example" {
  type = "GigabitEthernet"
  name = "3"

  depends_on = [iosxe_interface_ethernet.example]
}
