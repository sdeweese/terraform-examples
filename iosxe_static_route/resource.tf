# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_static_route" "example" {
  prefix = "5.5.5.5"
  mask   = "255.255.255.255"
  next_hops = [
    {
      next_hop  = "6.6.6.6"
      distance  = 10
      global    = false
      name      = "Route1"
      permanent = true
      tag       = 100
    }
  ]
}
