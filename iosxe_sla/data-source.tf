# Read back the object after the matching resource has run.
data "iosxe_sla" "example" {

  depends_on = [iosxe_sla.example]
}
