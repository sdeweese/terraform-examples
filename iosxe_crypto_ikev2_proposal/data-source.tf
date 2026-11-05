# Read back the object after the matching resource has run.
data "iosxe_crypto_ikev2_proposal" "example" {
  name = "PROPOSAL1"

  depends_on = [iosxe_crypto_ikev2_proposal.example]
}
