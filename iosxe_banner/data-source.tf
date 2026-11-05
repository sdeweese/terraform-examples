# Read back the object after the matching resource has run.
data "iosxe_banner" "example" {

  depends_on = [iosxe_banner.example]
}
