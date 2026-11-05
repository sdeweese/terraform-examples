# Read back the object after the matching resource has run.
data "iosxe_policy_map_event" "example" {
  name       = "dot1x_policy"
  event_type = "authentication-success"

  depends_on = [iosxe_policy_map_event.example]
}
