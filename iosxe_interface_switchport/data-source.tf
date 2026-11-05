# Read back the object after the matching resource has run.
data "iosxe_interface_switchport" "example" {
  type = "GigabitEthernet"
  name = "1/0/3"

  depends_on = [iosxe_interface_switchport.example]
}
