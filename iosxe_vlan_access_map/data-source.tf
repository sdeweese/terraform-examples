# Read back the object after the matching resource has run.
data "iosxe_vlan_access_map" "example" {
  name     = "VAM1"
  sequence = 10

  depends_on = [iosxe_vlan_access_map.example]
}
