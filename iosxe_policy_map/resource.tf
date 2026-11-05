# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_policy_map" "example" {
  name        = "POLICY1"
  description = "My first policy-map"
  classes = [
    {
      name = "CLASS1"
      actions = [
        {
          type              = "bandwidth"
          bandwidth_percent = 10
        }
      ]
    }
  ]
}
