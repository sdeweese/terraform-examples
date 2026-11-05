# Read back the object after the matching resource has run.
data "iosxe_crypto_ikev2_profile" "example" {
  name = "profile1"

  depends_on = [iosxe_crypto_ikev2_profile.example]
}
