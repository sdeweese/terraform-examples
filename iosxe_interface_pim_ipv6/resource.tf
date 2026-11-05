# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_interface_pim_ipv6" "example" {
  type        = "Loopback"
  name        = "100"
  pim         = true
  bfd         = false
  bsr_border  = false
  dr_priority = 10
}
