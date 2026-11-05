# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_as_path_access_list" "example" {
  name = 10
  entries = [
    {
      action = "permit"
      regex  = "^100$"
    }
  ]
}
