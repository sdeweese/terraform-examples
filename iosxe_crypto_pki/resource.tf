# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_crypto_pki" "example" {
  trustpoints = [
    {
      id                = "trustpoint1"
      enrollment_pkcs12 = true
      revocation_check  = ["none"]
      hash              = "sha256"
    }
  ]
}
