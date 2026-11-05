output "observed_id" {
  description = "Provider ID read back from the device after applying the example resource."
  value       = data.iosxe_large_community_list_expanded.example.id
}
