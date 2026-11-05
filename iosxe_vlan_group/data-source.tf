# Read back the object after the matching resource has run.
data "iosxe_vlan_group" "example" {
  name = "GROUP1"

  depends_on = [iosxe_vlan_group.example]
}
