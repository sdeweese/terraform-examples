# Read back the object after the matching resource has run.
data "iosxe_bfd" "example" {

  depends_on = [iosxe_bfd.example]
}
