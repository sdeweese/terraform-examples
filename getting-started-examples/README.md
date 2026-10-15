# Getting Started Examples

- [VLAN, single file](01-vlan-single-file/): creates a Layer 2 VLAN on one switch without changing the default gateway or assigning ports.
- [Multi-device ACL, split files](02-acl-multi-device/): creates the same ACL on two switches using conventional provider, variable, and resource files.
- [Two lab switches, shared ACL](03-multi-device-acl/): applies identical ACL resources to the two lab devices using aliased NETCONF providers and a shared local value.

All examples use the Cisco IOS XE provider over NETCONF. Run Terraform from the specific example folder you intend to use; Terraform reads configuration files in the current folder, not in sibling folders. Review each plan before applying changes to a switch.
