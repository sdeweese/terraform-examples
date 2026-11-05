# Read back the object after the matching resource has run.
data "iosxe_object_group" "example" {

  depends_on = [iosxe_object_group.example]
}
