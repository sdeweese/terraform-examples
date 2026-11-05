# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_interface_stackwise_virtual" "example" {
  type                  = "TenGigabitEthernet"
  name                  = "1/0/1"
  link                  = 1
  dual_active_detection = true
}
