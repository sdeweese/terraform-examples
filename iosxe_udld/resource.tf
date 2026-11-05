# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_udld" "example" {
  aggressive        = true
  enable            = true
  message_time      = 77
  recovery_interval = 8640
}
