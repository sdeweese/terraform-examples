# Read back the object after the matching resource has run.
data "iosxe_crypto_ikev2_keyring" "example" {
  name = "keyring1"

  depends_on = [iosxe_crypto_ikev2_keyring.example]
}
