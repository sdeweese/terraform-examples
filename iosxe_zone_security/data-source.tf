# Read back the object after the matching resource has run.
data "iosxe_zone_security" "example" {
  name = "INSIDE"

  depends_on = [iosxe_zone_security.example]
}
