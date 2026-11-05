# Read back the object after the matching resource has run.
data "iosxe_interface_port_channel_subinterface" "example" {
  name = "20.666"

  depends_on = [iosxe_interface_port_channel_subinterface.example]
}
