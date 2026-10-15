# Multi-Device ACL (Split Files)

This example creates the same named extended ACL on two IOS XE switches. The configuration is split into `provider.tf`, `variables.tf`, and `acl.tf` to show a conventional multi-file Terraform layout.

## Before you run it

- Use IOS XE switches with NETCONF enabled (`netconf-yang`) and reachable over SSH on port 830.
- The provider is pinned to `0.15.x`; NETCONF became its default protocol in version 0.15.0. Earlier versions default to RESTCONF.
- The sample ACL permits TCP/830 and TCP/22 from **any source**, then denies other IP traffic. Restrict the source before applying this ACL in a real environment.
- This example creates the ACL objects; it does not attach the ACL to an interface. Confirm the intended interface and direction before adding an interface binding.
- The tracked template contains only a password placeholder. Terraform state can still contain sensitive values, so keep the state private.

## Configure local values

Copy [`terraform.tfvars.example`](terraform.tfvars.example) to `terraform.tfvars`. In the copied file, change `switch1_host` and `switch2_host` to your two switch management IPs or hostnames, `switch_username` to the NETCONF username, and `switch_password` to the device password. The sample file marks each value to change.

Terraform automatically loads `terraform.tfvars` from this directory. The root `.gitignore` excludes this local file; do not commit real credentials.

## Run

From this directory:

```sh
terraform init
terraform fmt -check
terraform validate
terraform plan
```

Review the plan against both switches before running `terraform apply`.

## Verify on each switch

```text
show ip access-lists ACL_MGMT_INBOUND
```
