# Read back the object after the matching resource has run.
data "iosxe_crypto_ipsec_profile" "example" {
  name = "vpn200"

  depends_on = [iosxe_crypto_ipsec_profile.example]
}
