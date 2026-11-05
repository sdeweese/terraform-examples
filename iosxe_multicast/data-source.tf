# Read back the object after the matching resource has run.
data "iosxe_multicast" "example" {

  depends_on = [iosxe_multicast.example]
}
