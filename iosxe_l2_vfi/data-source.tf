# Read back the object after the matching resource has run.
data "iosxe_l2_vfi" "example" {
  name = "TENANT-A"

  depends_on = [iosxe_l2_vfi.example]
}
