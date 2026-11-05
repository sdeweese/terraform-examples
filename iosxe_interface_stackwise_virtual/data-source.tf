# Read back the object after the matching resource has run.
data "iosxe_interface_stackwise_virtual" "example" {
  type = "TenGigabitEthernet"
  name = "1/0/1"

  depends_on = [iosxe_interface_stackwise_virtual.example]
}
