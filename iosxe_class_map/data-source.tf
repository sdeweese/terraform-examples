# Read back the object after the matching resource has run.
data "iosxe_class_map" "example" {
  name = "CM1"

  depends_on = [iosxe_class_map.example]
}
