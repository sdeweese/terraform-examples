output "observed_id" {
  description = "Provider ID read back from the device after applying the example resource."
  value       = data.iosxe_bgp_address_family_vpnv6.example.id
}
