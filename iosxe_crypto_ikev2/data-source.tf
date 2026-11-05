# Read back the object after the matching resource has run.
data "iosxe_crypto_ikev2" "example" {

  depends_on = [iosxe_crypto_ikev2.example]
}
