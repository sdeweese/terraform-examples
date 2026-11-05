# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_msdp" "example" {
  originator_id = "Loopback100"
  peers = [
    {
      addr                    = "10.1.1.1"
      remote_as               = 65000
      connect_source_loopback = 100
    }
  ]
  passwords = [
    {
      addr       = "10.1.1.1"
      encryption = 0
      password   = "Cisco123"
    }
  ]
  vrfs = [
    {
      vrf           = "VRF1"
      originator_id = "Loopback200"
      peers = [
        {
          addr                    = "10.1.1.1"
          remote_as               = 65000
          connect_source_loopback = 200
        }
      ]
      passwords = [
        {
          addr       = "10.1.1.1"
          encryption = 0
          password   = "Cisco123"
        }
      ]
    }
  ]
}
