# Read back the object after the matching resource has run.
data "iosxe_bgp_peer_session_template" "example" {
  asn           = "65000"
  template_name = "PEER_SESSION_TEMPLATE_1"

  depends_on = [iosxe_bgp_peer_session_template.example]
}
