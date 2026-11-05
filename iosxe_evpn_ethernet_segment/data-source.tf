# Read back the object after the matching resource has run.
data "iosxe_evpn_ethernet_segment" "example" {
  es_value = 1

  depends_on = [iosxe_evpn_ethernet_segment.example]
}
