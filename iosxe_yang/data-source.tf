# Read back the object after the matching resource has run.
data "iosxe_yang" "example" {
  path = "/Cisco-IOS-XE-native:native/banner/login"

  depends_on = [iosxe_yang.example]
}
