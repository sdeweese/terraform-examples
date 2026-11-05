# Read back the object after the matching resource has run.
data "iosxe_ospf_vrf" "example" {
  process_id = 2
  vrf        = "VRF1"

  depends_on = [iosxe_ospf_vrf.example]
}
