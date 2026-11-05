# Read back the object after the matching resource has run.
data "iosxe_eigrp" "example" {
  name = "TOPGEN"

  depends_on = [iosxe_eigrp.example]
}
