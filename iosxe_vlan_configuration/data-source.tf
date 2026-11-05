# Read back the object after the matching resource has run.
data "iosxe_vlan_configuration" "example" {
  vlan_id = "123"

  depends_on = [iosxe_vlan_configuration.example]
}
