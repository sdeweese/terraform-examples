# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_commit" "example" {
}

# Example with save_config enabled for transactional workflows
resource "iosxe_commit" "with_save" {
  device      = "router1"
  save_config = true # Saves to startup-config after commit
}
