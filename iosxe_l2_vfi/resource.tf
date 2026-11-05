# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_l2_vfi" "example" {
  name   = "TENANT-A"
  mode   = "manual"
  vpn_id = 20001
  neighbors = [
    {
      ip_address    = "172.16.255.2"
      encapsulation = "mpls"
    }
  ]
}
