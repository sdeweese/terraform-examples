# Read back the object after the matching resource has run.
data "iosxe_service_template" "example" {
  name = "MY_TEMPLATE"

  depends_on = [iosxe_service_template.example]
}
