# Read back the object after the matching resource has run.
data "iosxe_clock" "example" {

  depends_on = [iosxe_clock.example]
}
