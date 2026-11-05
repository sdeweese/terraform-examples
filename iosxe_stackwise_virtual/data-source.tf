# Read back the object after the matching resource has run.
data "iosxe_stackwise_virtual" "example" {

  depends_on = [iosxe_stackwise_virtual.example]
}
