output "observed_id" {
  description = "Provider ID read back from the device after applying the example resource."
  value       = data.iosxe_ospfv3_address_family_ipv6_vrf.example.id
}
