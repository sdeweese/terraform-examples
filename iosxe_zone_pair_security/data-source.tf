# Read back the object after the matching resource has run.
data "iosxe_zone_pair_security" "example" {
  name = "ZP_IN_OUT"

  depends_on = [iosxe_zone_pair_security.example]
}
