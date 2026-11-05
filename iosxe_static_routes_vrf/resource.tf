# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_static_routes_vrf" "example" {
  vrf = "VRF1"
  routes = [
    {
      prefix = "6.6.6.6"
      mask   = "255.255.255.255"
      next_hops = [
        {
          next_hop  = "7.7.7.7"
          distance  = 10
          global    = false
          name      = "Route1"
          permanent = true
          tag       = 100
        }
      ]
    }
  ]
}
