# Read back the object after the matching resource has run.
data "iosxe_snmp_server" "example" {

  depends_on = [iosxe_snmp_server.example]
}
