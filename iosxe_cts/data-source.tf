# Read back the object after the matching resource has run.
data "iosxe_cts" "example" {

  depends_on = [iosxe_cts.example]
}
