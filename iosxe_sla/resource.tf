# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_sla" "example" {
  entries = [
    {
      number                = 20
      icmp_echo_destination = "192.168.10.10"
      icmp_echo_source_ip   = "192.168.1.1"
      icmp_echo_frequency   = 10
    }
  ]
  schedules = [
    {
      entry_number   = 20
      life           = 4000
      start_time_now = true
    }
  ]
}
