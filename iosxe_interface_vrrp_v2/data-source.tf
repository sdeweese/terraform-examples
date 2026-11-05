# Read back the object after the matching resource has run.
data "iosxe_interface_vrrp_v2" "example" {
  type     = "Vlan"
  name     = "123"
  group_id = 1

  depends_on = [iosxe_interface_vrrp_v2.example]
}
