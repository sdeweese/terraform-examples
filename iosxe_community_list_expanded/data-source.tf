# Read back the object after the matching resource has run.
data "iosxe_community_list_expanded" "example" {
  name = "CLE1"

  depends_on = [iosxe_community_list_expanded.example]
}
