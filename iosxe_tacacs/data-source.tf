# Read back the object after the matching resource has run.
data "iosxe_tacacs" "example" {
  name = "tacacs_10.10.15.13"

  depends_on = [iosxe_tacacs.example]
}
