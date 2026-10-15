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

The tracked `terraform.tfvars.example` files mark the values you need to change: switch IP or hostname, NETCONF username, and device password. Copy the template in the example folder you are using to `terraform.tfvars`, edit those fields with your lab values, and run Terraform from that same folder. `.gitignore` excludes real `.tfvars` files, Terraform state, plans, and the `.terraform` working directory. Never commit credentials or state: Terraform state can contain sensitive values, and `sensitive = true` only hides values from some CLI output.

## What the Terraform files do

- **`.tf` configuration files** contain Terraform settings, provider configurations, input declarations, and resources. Names such as `main.tf`, `provider.tf`, `variables.tf`, and `acl.tf` are conventions for organizing the files. Terraform combines all `.tf` files in the current example directory into one configuration; it does not load `.tf` files from other directories.
- **`variables.tf`** is the conventional place to declare the inputs the configuration accepts, using `variable` blocks. A declaration defines the input's name, type, description, default (if any), and whether Terraform should mark it sensitive. The filename is optional: the single-file VLAN example declares its variables in `main.tf` instead.
- **`terraform.tfvars`** assigns actual values to declared inputs, for example your switch addresses and password. Terraform automatically loads this exact filename from the directory where you run Terraform, so you do not need to type those values at each prompt. Create it by copying `terraform.tfvars.example` and editing the copy. The `.example` template is documentation and is not auto-loaded.
- **`terraform.tfvars.example`** is a safe template to commit. It uses documentation-only IP addresses and a password placeholder. Keep your real `terraform.tfvars` private; the repository `.gitignore` excludes it.
- **`.terraform.lock.hcl`** records the selected provider versions and checksums so future `terraform init` runs can use consistent provider packages. If generated for an example, commit this lock file.
- **`terraform.tfstate`** records Terraform's tracked resource state and can contain sensitive information. Keep it private and do not commit it. The `.terraform/` directory contains downloaded provider working files and should also stay out of Git.

If a required variable has no value in `terraform.tfvars`, another automatically loaded variable file, an environment variable, a CLI option, or a default, Terraform prompts for it (or reports it missing in non-interactive runs). `sensitive = true` hides a variable in some CLI output, but does not by itself keep secrets out of Terraform state.
