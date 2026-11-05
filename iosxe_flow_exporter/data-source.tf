# Read back the object after the matching resource has run.
data "iosxe_flow_exporter" "example" {
  name = "EXPORTER1"

  depends_on = [iosxe_flow_exporter.example]
}
