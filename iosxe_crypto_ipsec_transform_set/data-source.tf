# Read back the object after the matching resource has run.
data "iosxe_crypto_ipsec_transform_set" "example" {
  name = "TEST"

  depends_on = [iosxe_crypto_ipsec_transform_set.example]
}
