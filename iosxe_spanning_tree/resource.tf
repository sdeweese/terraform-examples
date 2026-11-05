# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_spanning_tree" "example" {
  mode                       = "mst"
  logging                    = true
  loopguard_default          = true
  portfast_default           = true
  portfast_bpduguard_default = true
  extend_system_id           = true
  mst_instances = [
    {
      id       = 1
      vlan_ids = [10]
    }
  ]
  vlans = [
    {
      id       = "10"
      priority = 32768
    }
  ]
}
