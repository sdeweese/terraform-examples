# Read back the object after the matching resource has run.
data "iosxe_ospfv3" "example" {
  process_id = 1

  depends_on = [iosxe_ospfv3.example]
}
