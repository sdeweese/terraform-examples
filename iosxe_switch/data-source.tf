# Read back the object after the matching resource has run.
data "iosxe_switch" "example" {
  number = 2

  depends_on = [iosxe_switch.example]
}
