# Read back the object after the matching resource has run.
data "iosxe_crypto_pki" "example" {

  depends_on = [iosxe_crypto_pki.example]
}
