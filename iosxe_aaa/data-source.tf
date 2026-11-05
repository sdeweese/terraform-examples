# Read back the object after the matching resource has run.
data "iosxe_aaa" "example" {

  depends_on = [iosxe_aaa.example]
}
