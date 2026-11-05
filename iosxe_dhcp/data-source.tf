# Read back the object after the matching resource has run.
data "iosxe_dhcp" "example" {

  depends_on = [iosxe_dhcp.example]
}
