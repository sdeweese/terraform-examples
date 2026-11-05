# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_mpls" "example" {
  label_mode_all_vrfs_all_afs_per_vrf = true
}
