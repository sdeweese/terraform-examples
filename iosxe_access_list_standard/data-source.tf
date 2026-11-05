# Read back the object after the matching resource has run.
data "iosxe_access_list_standard" "example" {
  name = "SACL1"

  depends_on = [iosxe_access_list_standard.example]
}
