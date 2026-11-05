# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_parameter_map" "example" {
  name                    = "PM_INSPECT1"
  icmp_idle_time          = 10
  sessions_maximum        = 10000
  tcp_idle_time           = 3600
  tcp_max_incomplete_host = 100
}
