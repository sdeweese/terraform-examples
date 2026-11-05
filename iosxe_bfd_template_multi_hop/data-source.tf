# Read back the object after the matching resource has run.
data "iosxe_bfd_template_multi_hop" "example" {
  name = "T11"

  depends_on = [iosxe_bfd_template_multi_hop.example]
}
