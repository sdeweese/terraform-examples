# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_interface_isis" "example" {
  type = "Loopback"
  name = "100"
  ipv4_metric_levels = [
    {
      level = "level-1"
      value = 100
    }
  ]
}
