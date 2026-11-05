# Read back the object after the matching resource has run.
data "iosxe_static_route" "example" {
  prefix = "5.5.5.5"
  mask   = "255.255.255.255"

  depends_on = [iosxe_static_route.example]
}
