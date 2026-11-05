# Read back the object after the matching resource has run.
data "iosxe_crypto" "example" {

  depends_on = [iosxe_crypto.example]
}
