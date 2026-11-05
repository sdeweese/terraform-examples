# Read back the object after the matching resource has run.
data "iosxe_bfd_template_single_hop" "example" {
  name = "SH-TEMPLATE-1"

  depends_on = [iosxe_bfd_template_single_hop.example]
}
