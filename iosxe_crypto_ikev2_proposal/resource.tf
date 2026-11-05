# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_crypto_ikev2_proposal" "example" {
  name                   = "PROPOSAL1"
  encryption_aes_cbc_256 = true
  group_sixteen          = true
  integrity_sha256       = true
}
