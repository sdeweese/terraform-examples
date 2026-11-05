# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_crypto_ipsec_profile" "example" {
  name              = "vpn200"
  set_transform_set = ["TS1"]
  set_ikev2_profile = "vpn300"
  set_pfs_group     = "group20"
}
