# Read back the object after the matching resource has run.
data "iosxe_eem" "example" {

  depends_on = [iosxe_eem.example]
}
