# Read back the object after the matching resource has run.
data "iosxe_vlan_filter" "example" {
  word = "VAM1"

  depends_on = [iosxe_vlan_filter.example]
}
