# Read back the object after the matching resource has run.
data "iosxe_qos" "example" {

  depends_on = [iosxe_qos.example]
}
