# Multi-Device ACL for Two Lab Switches

This example creates the same extended management ACL on two IOS XE switches over NETCONF. It is based on the two-device lab scenario for targets ending in `.5` and `.55`; the tracked variable template uses documentation-only addresses. Set your actual addresses only in a local, untracked `terraform.tfvars` file.

The configuration uses two aliased provider instances in `provider.tf`, input declarations in `variables.tf`, and one shared ACL definition in `acl.tf`. Terraform applies the same entries to both switches.

## Before you run it

- Use IOS XE switches with NETCONF enabled (`netconf-yang`) and reachable over SSH on port 830.
- The provider is pinned to `~> 0.15.0`, where NETCONF is the default protocol.
- The sample ACL permits TCP/830 and TCP/22 from any source, then denies other IP traffic. Restrict source addresses before applying outside a lab.
- The ACL objects are not attached to an interface; they do not filter traffic until attached.
- Do not commit real credentials or Terraform state.

## Configure and run

From this directory, copy the template and edit the marked fields in `terraform.tfvars`: set `switch5_host` and `switch55_host` to your two switch management IPs or hostnames, `switch_username` to the NETCONF username, and `switch_password` to the device password. The example IPs are documentation-only placeholders.

```sh
cp terraform.tfvars.example terraform.tfvars
# Edit the marked IP, username, and password values in terraform.tfvars.
terraform init
terraform fmt -check
terraform validate
terraform plan
```

Review the plan for two ACL resources, one on each switch. Apply only after confirming the target devices and the complete ACL entries:

```sh
terraform apply
```

## Verify and clean up

On each switch:

```text
show ip access-lists ACL_MGMT_INBOUND
```

When finished, from this same directory:

```sh
terraform destroy
```

Review the destroy plan before confirming. This removes the ACL resources tracked in this example's local state.
