# Read back the object after the matching resource has run.
data "iosxe_udld" "example" {

  depends_on = [iosxe_udld.example]
}
