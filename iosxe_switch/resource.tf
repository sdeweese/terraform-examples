# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_switch" "example" {
  number    = 2
  provision = "c9300-24p"
}
