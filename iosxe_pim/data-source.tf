# Read back the object after the matching resource has run.
data "iosxe_pim" "example" {

  depends_on = [iosxe_pim.example]
}
