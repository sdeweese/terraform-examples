# Read back the object after the matching resource has run.
data "iosxe_access_list_ipv6" "example" {
  name = "V6ACL1"

  depends_on = [iosxe_access_list_ipv6.example]
}
