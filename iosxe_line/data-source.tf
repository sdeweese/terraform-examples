# Read back the object after the matching resource has run.
data "iosxe_line" "example" {

  depends_on = [iosxe_line.example]
}
