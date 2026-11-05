# Read back the object after the matching resource has run.
data "iosxe_spanning_tree" "example" {

  depends_on = [iosxe_spanning_tree.example]
}
