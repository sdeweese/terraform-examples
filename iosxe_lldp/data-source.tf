# Read back the object after the matching resource has run.
data "iosxe_lldp" "example" {

  depends_on = [iosxe_lldp.example]
}
