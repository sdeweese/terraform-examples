output "observed_id" {
  description = "Provider ID read back from the device after applying the example resource."
  value       = data.iosxe_l2_vfi.example.id
}
