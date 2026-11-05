# Read back the object after the matching resource has run.
data "iosxe_tacacs_server" "example" {

  depends_on = [iosxe_tacacs_server.example]
}
