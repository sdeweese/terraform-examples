# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_license" "example" {
  boot_level_network_advantage       = true
  boot_level_network_advantage_addon = "dna-advantage"
  smart_transport_type               = "Off"
}
