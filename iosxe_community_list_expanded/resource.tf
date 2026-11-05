# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_community_list_expanded" "example" {
  name = "CLE1"
  entries = [
    {
      action = "permit"
      regex  = "65000:500"
    }
  ]
}
