# Read back the object after the matching resource has run.
data "iosxe_as_path_access_list" "example" {
  name = 10

  depends_on = [iosxe_as_path_access_list.example]
}
