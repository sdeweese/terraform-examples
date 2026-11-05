# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_vtp" "example" {
  file             = "TEST"
  version          = 3
  interface        = "GigabitEthernet1/0/1"
  password         = "test123"
  password_hidden  = false
  domain           = "TESTDOMAIN"
  mode_transparent = true
}
