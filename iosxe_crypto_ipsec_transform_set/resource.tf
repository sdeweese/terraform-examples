# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_crypto_ipsec_transform_set" "example" {
  name        = "TEST"
  esp         = "esp-aes"
  esp_hmac    = "esp-sha-hmac"
  mode_tunnel = true
}
