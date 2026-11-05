# Read back the object after the matching resource has run.
data "iosxe_bgp_peer_policy_template" "example" {
  asn  = "65000"
  name = "PEERPOLICY_1"

  depends_on = [iosxe_bgp_peer_policy_template.example]
}
