# Read back the object after the matching resource has run.
data "iosxe_flow_record" "example" {
  name = "FNF1"

  depends_on = [iosxe_flow_record.example]
}
