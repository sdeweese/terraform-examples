# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_cdp" "example" {
  holdtime        = 15
  timer           = 5
  run             = true
  filter_tlv_list = "TLIST"
  tlv_lists = [
    {
      name            = "TLIST"
      vtp_mgmt_domain = true
      cos             = true
      duplex          = true
      trust           = true
      version         = true
    }
  ]
}
