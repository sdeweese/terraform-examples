# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_username" "example" {
  name                = "user1"
  privilege           = 15
  description         = "User1 description"
  password_encryption = "0"
  password            = "MyPassword"
}
