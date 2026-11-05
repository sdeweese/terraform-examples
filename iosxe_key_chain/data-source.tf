# Read back the object after the matching resource has run.
data "iosxe_key_chain" "example" {
  name = "OSPF-AUTH"

  depends_on = [iosxe_key_chain.example]
}
