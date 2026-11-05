# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_platform" "example" {
  punt_keepalive_disable_kernel_core        = true
  punt_keepalive_settings_fatal_count       = 15
  punt_keepalive_settings_transmit_interval = 15
  punt_keepalive_settings_warning_count     = 15
}
