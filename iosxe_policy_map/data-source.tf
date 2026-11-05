# Read back the object after the matching resource has run.
data "iosxe_policy_map" "example" {
  name = "POLICY1"

  depends_on = [iosxe_policy_map.example]
}
