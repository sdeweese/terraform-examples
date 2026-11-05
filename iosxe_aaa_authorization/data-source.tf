# Read back the object after the matching resource has run.
data "iosxe_aaa_authorization" "example" {

  depends_on = [iosxe_aaa_authorization.example]
}
