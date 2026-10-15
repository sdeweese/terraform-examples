# This sample permits management traffic from any source. Restrict the source
# before using this ACL outside a lab.
resource "iosxe_access_list_extended" "mgmt_acl_sw1" {
  provider = iosxe.switch1
  name     = "ACL_MGMT_INBOUND"

  entries = [
    {
      sequence               = 10
      remark                 = "Permit NETCONF management traffic"
      ace_rule_action        = "permit"
      ace_rule_protocol      = "tcp"
      source_any             = true
      destination_any        = true
      destination_port_equal = "830"
    },
    {
      sequence               = 20
      remark                 = "Permit SSH management traffic"
      ace_rule_action        = "permit"
      ace_rule_protocol      = "tcp"
      source_any             = true
      destination_any        = true
      destination_port_equal = "22"
    },
    {
      sequence          = 30
      remark            = "Deny all other IP traffic"
      ace_rule_action   = "deny"
      ace_rule_protocol = "ip"
      source_any        = true
      destination_any   = true
    },
  ]
}

resource "iosxe_access_list_extended" "mgmt_acl_sw2" {
  provider = iosxe.switch2
  name     = "ACL_MGMT_INBOUND"

  entries = [
    {
      sequence               = 10
      remark                 = "Permit NETCONF management traffic"
      ace_rule_action        = "permit"
      ace_rule_protocol      = "tcp"
      source_any             = true
      destination_any        = true
      destination_port_equal = "830"
    },
    {
      sequence               = 20
      remark                 = "Permit SSH management traffic"
      ace_rule_action        = "permit"
      ace_rule_protocol      = "tcp"
      source_any             = true
      destination_any        = true
      destination_port_equal = "22"
    },
    {
      sequence          = 30
      remark            = "Deny all other IP traffic"
      ace_rule_action   = "deny"
      ace_rule_protocol = "ip"
      source_any        = true
      destination_any   = true
    },
  ]
}
