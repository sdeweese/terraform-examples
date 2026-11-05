# Read back the object after the matching resource has run.
data "iosxe_msdp" "example" {

  depends_on = [iosxe_msdp.example]
}
