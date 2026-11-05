# Read back the object after the matching resource has run.
data "iosxe_device_sensor" "example" {

  depends_on = [iosxe_device_sensor.example]
}
