# Read back the object after the matching resource has run.
data "iosxe_nat" "example" {

  depends_on = [iosxe_nat.example]
}
