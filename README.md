# Terraform NETCONF Examples for Cisco IOS XE

Small, independent Terraform examples for configuring Cisco IOS XE over NETCONF. Each example is a separate Terraform root module with its own working directory and state.

## Examples

| Folder | Use case | Configuration layout | Expected plan |
| --- | --- | --- | --- |
| [`01-vlan-single-file`](getting-started-examples/01-vlan-single-file/) | Create VLAN 500 on one switch; does not create an SVI, change a gateway, or assign ports | Provider, inputs, and resource in `main.tf` | One VLAN resource to add on first run |
| [`02-acl-multi-device`](getting-started-examples/02-acl-multi-device/) | Create the same management ACL on two switches | Provider aliases, variables, and ACLs split across files | Two ACL resources to add on first run |
| [`03-multi-device-acl`](getting-started-examples/03-multi-device-acl/) | Create the same ACL on two switches, corresponding to the `.5` and `.55` lab targets | Provider aliases, variables, and ACLs split across files | Two ACL resources to add on first run |

The ACL samples create ACL objects only; they do not attach them to interfaces. The sample rules allow TCP/830 and TCP/22 from any source, then deny other IP traffic. Restrict source addresses before applying in a real environment.

## Requirements

- Terraform CLI `>= 1.3.0`
- Cisco IOS XE devices with NETCONF enabled (`netconf-yang`) and reachable over SSH on port 830
- CiscoDevNet/iosxe provider `~> 0.15.0` (NETCONF is the default protocol in this version line)
- A local variable file with your device addresses and credentials

## Run an example

Change into exactly one example directory. Each folder is an independent Terraform root module:

```sh
cd getting-started-examples/01-vlan-single-file
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your lab address and credentials.
terraform init
terraform fmt -check
terraform validate
terraform plan
```

Repeat from another example folder when you want to use a different scenario. Review the plan carefully before `terraform apply`. Expected plan counts are listed above for a first run; an existing configuration may instead show no changes or updates.

Terraform reads the `.tf` files in the directory where you run it. It does not automatically read `.tf` files in sibling or child folders. Run each example from its own folder so Terraform uses the intended configuration and state.

## Destroy after the example

From the same example directory and using the same local state:

```sh
terraform destroy
```

Review the destroy plan before confirming. This removes resources tracked in that example's state. Do not destroy a VLAN or ACL that other device configuration depends on.

## Credentials and state

The tracked `terraform.tfvars.example` files contain documentation-only addresses and password placeholders. Copy one to `terraform.tfvars` and enter real values locally. `.gitignore` excludes real `.tfvars` files, Terraform state, plans, and the `.terraform` working directory. Never commit credentials or state: Terraform state can contain sensitive values, and `sensitive = true` only hides values from some CLI output.
