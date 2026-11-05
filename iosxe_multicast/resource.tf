# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_multicast" "example" {
  multipath          = true
  multipath_s_g_hash = "next-hop-based"
  vrfs = [
    {
      vrf                = "VRF1"
      multipath          = true
      multipath_s_g_hash = "next-hop-based"
    }
  ]
}
