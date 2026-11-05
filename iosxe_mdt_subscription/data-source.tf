# Read back the object after the matching resource has run.
data "iosxe_mdt_subscription" "example" {
  subscription_id = 101

  depends_on = [iosxe_mdt_subscription.example]
}
