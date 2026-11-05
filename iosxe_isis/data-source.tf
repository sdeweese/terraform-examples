# Read back the object after the matching resource has run.
data "iosxe_isis" "example" {
  area_tag = "TEST"

  depends_on = [iosxe_isis.example]
}
