# Read back the object after the matching resource has run.
data "iosxe_system" "example" {

  depends_on = [iosxe_system.example]
}
