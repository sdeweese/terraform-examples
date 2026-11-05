# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_cli" "example" {
  cli = <<-EOT
  interface Loopback123
  description configured-via-cli
  EOT
}
