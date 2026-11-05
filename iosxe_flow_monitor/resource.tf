# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_flow_monitor" "example" {
  name        = "MON1"
  description = "My monitor"
  exporters = [
    {
      name = "EXPORTER1"
    }
  ]
  cache_timeout_active   = 60
  cache_timeout_inactive = 10
  record                 = "FNF1"
}
