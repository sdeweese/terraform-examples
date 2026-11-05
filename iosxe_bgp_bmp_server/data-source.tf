# Read back the object after the matching resource has run.
data "iosxe_bgp_bmp_server" "example" {
  asn       = "65000"
  server_id = 1

  depends_on = [iosxe_bgp_bmp_server.example]
}
