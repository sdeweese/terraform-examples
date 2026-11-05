# Read back the object after the matching resource has run.
data "iosxe_ipv6_prefix_list" "example" {

  depends_on = [iosxe_ipv6_prefix_list.example]
}
