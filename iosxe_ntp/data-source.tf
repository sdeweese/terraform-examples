# Read back the object after the matching resource has run.
data "iosxe_ntp" "example" {

  depends_on = [iosxe_ntp.example]
}
