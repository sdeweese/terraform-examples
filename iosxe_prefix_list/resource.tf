# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_prefix_list" "example" {
  prefixes = [
    {
      name   = "PREFIX_LIST_1"
      seq    = 10
      action = "permit"
      ip     = "10.0.0.0/8"
      ge     = 24
      le     = 32
    }
  ]
  prefix_list_description = [
    {
      name        = "PREFIX_LIST_1"
      description = "My prefix list"
    }
  ]
}
