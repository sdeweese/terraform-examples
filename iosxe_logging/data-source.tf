# Read back the object after the matching resource has run.
data "iosxe_logging" "example" {

  depends_on = [iosxe_logging.example]
}
