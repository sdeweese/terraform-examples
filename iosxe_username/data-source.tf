# Read back the object after the matching resource has run.
data "iosxe_username" "example" {
  name = "user1"

  depends_on = [iosxe_username.example]
}
