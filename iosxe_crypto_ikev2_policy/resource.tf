# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_crypto_ikev2_policy" "example" {
  name                   = "policy1"
  match_address_local_ip = ["1.2.3.4"]
  match_fvrf_any         = true
  proposals = [
    {
      proposals = "proposal123"
    }
  ]
}
