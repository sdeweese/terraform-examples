# Read back the object after the matching resource has run.
data "iosxe_license" "example" {

  depends_on = [iosxe_license.example]
}
