# Read back the object after the matching resource has run.
data "iosxe_platform" "example" {

  depends_on = [iosxe_platform.example]
}
