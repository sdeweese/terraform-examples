# Read back the object after the matching resource has run.
data "iosxe_parameter_map" "example" {
  name = "PM_INSPECT1"

  depends_on = [iosxe_parameter_map.example]
}
