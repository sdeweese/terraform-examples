# Read back the object after the matching resource has run.
data "iosxe_arp" "example" {

  depends_on = [iosxe_arp.example]
}
