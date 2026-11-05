# Read back the object after the matching resource has run.
data "iosxe_dot1x" "example" {

  depends_on = [iosxe_dot1x.example]
}
