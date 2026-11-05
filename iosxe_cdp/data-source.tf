# Read back the object after the matching resource has run.
data "iosxe_cdp" "example" {

  depends_on = [iosxe_cdp.example]
}
