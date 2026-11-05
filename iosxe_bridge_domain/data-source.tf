# Read back the object after the matching resource has run.
data "iosxe_bridge_domain" "example" {
  bridge_domain_id = 836

  depends_on = [iosxe_bridge_domain.example]
}
