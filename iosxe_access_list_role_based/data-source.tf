# Read back the object after the matching resource has run.
data "iosxe_access_list_role_based" "example" {
  name = "RBACL1"

  depends_on = [iosxe_access_list_role_based.example]
}
