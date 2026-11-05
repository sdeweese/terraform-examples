# Read back the object after the matching resource has run.
data "iosxe_vtp" "example" {

  depends_on = [iosxe_vtp.example]
}
