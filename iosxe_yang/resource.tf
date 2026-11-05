# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_yang" "simple" {
  path = "/Cisco-IOS-XE-native:native/banner/login"
  attributes = {
    banner = "My Banner"
  }
}

resource "iosxe_yang" "nested_list" {
  path = "/Cisco-IOS-XE-native:native/ip"
  attributes = {
    source-route = "true"
  }
  lists = [{
    name = "vrf"
    key  = "name"
    items = [
      {
        name = "VRF1"
      }
    ]
  }]
}
