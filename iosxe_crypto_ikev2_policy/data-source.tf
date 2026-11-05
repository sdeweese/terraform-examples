# Read back the object after the matching resource has run.
data "iosxe_crypto_ikev2_policy" "example" {
  name = "policy1"

  depends_on = [iosxe_crypto_ikev2_policy.example]
}
