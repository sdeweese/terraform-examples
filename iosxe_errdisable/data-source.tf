# Read back the object after the matching resource has run.
data "iosxe_errdisable" "example" {

  depends_on = [iosxe_errdisable.example]
}
