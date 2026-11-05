# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_isis" "example" {
  area_tag = "TEST"
  nets = [
    {
      tag = "49.0001.1920.0000.2001.00"
    }
  ]
  metric_style_wide         = true
  log_adjacency_changes     = true
  log_adjacency_changes_all = true
}
