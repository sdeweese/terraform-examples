# Read back the object after the matching resource has run.
data "iosxe_ospf" "example" {
  process_id = 1

  depends_on = [iosxe_ospf.example]
}
