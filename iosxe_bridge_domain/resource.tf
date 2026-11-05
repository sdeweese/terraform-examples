# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_bridge_domain" "example" {
  bridge_domain_id = 836
  member_vni       = 10800
  member_interfaces = [
    {
      interface = "GigabitEthernet2"
      service_instances = [
        {
          instance_id = 836
        }
      ]
    }
  ]
}
