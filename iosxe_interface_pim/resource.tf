# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_interface_pim" "example" {
  type              = "Loopback"
  name              = "100"
  passive           = false
  dense_mode        = false
  sparse_mode       = true
  sparse_dense_mode = false
  bfd               = false
  border            = false
  bsr_border        = false
  dr_priority       = 10
}
