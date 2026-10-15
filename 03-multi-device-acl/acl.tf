# Lab example only: this ACL allows management traffic from any source.
# Restrict the source before applying outside an isolated lab.
locals {
  management_acl_entries = [
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

resource "iosxe_access_list_extended" "management_switch5" {
  provider = iosxe.switch5
  name     = "ACL_MGMT_INBOUND"
  entries  = local.management_acl_entries
}

resource "iosxe_access_list_extended" "management_switch55" {
  provider = iosxe.switch55
  name     = "ACL_MGMT_INBOUND"
  entries  = local.management_acl_entries
}
