# Read back the object after the matching resource has run.
data "iosxe_ipv6_local_pool" "example" {
  name = "DHCPv6-PD"

  depends_on = [iosxe_ipv6_local_pool.example]
}
