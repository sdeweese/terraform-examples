output "observed_id" {
  description = "Provider ID read back from the device after applying the example resource."
  value       = data.iosxe_bgp_ipv4_mvpn_neighbor.example.id
}
