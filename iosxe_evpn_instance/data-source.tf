# Read back the object after the matching resource has run.
data "iosxe_evpn_instance" "example" {
  evpn_instance_num = 10

  depends_on = [iosxe_evpn_instance.example]
}
