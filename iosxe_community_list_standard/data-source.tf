# Read back the object after the matching resource has run.
data "iosxe_community_list_standard" "example" {
  name = "CLS1"

  depends_on = [iosxe_community_list_standard.example]
}
