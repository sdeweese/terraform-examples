# Read back the object after the matching resource has run.
data "iosxe_ospfv3_address_family_ipv4_vrf" "example" {
  process_id = 2
  vrf        = "VRF1"

  depends_on = [iosxe_ospfv3_address_family_ipv4_vrf.example]
}
