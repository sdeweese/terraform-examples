# Read back the object after the matching resource has run.
data "iosxe_service" "example" {

  depends_on = [iosxe_service.example]
}
