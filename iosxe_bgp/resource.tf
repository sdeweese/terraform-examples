# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_bgp" "example" {
  asn                  = "65000"
  default_ipv4_unicast = false
  log_neighbor_changes = true
  bgp_graceful_restart = true
  bgp_update_delay     = 200
}
