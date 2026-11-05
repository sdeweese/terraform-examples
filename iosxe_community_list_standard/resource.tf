# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_community_list_standard" "example" {
  name           = "CLS1"
  deny_entries   = ["65000:500"]
  permit_entries = ["65000:501"]
}
