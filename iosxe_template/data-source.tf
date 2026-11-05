# Read back the object after the matching resource has run.
data "iosxe_template" "example" {
  template_name = "TEMP1"

  depends_on = [iosxe_template.example]
}
