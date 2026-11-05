# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_crypto_ikev2" "example" {
  nat_keepalive      = 20
  dpd                = 10
  dpd_retry_interval = 5
  dpd_query          = "periodic"
  http_url_cert      = true
}
