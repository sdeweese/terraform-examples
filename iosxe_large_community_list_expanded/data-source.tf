# Read back the object after the matching resource has run.
data "iosxe_large_community_list_expanded" "example" {
  name = "LCLE1"

  depends_on = [iosxe_large_community_list_expanded.example]
}
