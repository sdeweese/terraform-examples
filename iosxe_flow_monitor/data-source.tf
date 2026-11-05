# Read back the object after the matching resource has run.
data "iosxe_flow_monitor" "example" {
  name = "MON1"

  depends_on = [iosxe_flow_monitor.example]
}
