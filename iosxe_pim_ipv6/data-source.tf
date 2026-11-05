# Read back the object after the matching resource has run.
data "iosxe_pim_ipv6" "example" {

  depends_on = [iosxe_pim_ipv6.example]
}
