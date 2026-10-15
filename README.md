# Cisco IOS XE Terraform NETCONF Examples

Three independent getting-started examples for managing Cisco IOS XE with Terraform over NETCONF. Each example is its own Terraform root module with a separate working directory and local state.

## Requirements

- Terraform CLI `>= 1.3.0`
- Cisco IOS XE devices with NETCONF enabled (`netconf-yang`) and reachable over SSH on port 830
- CiscoDevNet/iosxe provider `~> 0.15.0`; this version line uses NETCONF by default
- A local `terraform.tfvars` file with your device connection values

## Examples

### 1. VLAN on one switch, all Terraform configuration in one file

Folder: [`getting-started-examples/01-vlan-single-file`](getting-started-examples/01-vlan-single-file/)

Creates Layer 2 VLAN 500 named `VLAN_500`. It does not create an SVI, change a default gateway, or assign a switchport to the VLAN. The provider, variable declarations, and resource are together in `main.tf`.

### 2. Same ACL on two switches, standard split files

Folder: [`getting-started-examples/02-acl-multi-device`](getting-started-examples/02-acl-multi-device/)

Uses `provider.tf`, `variables.tf`, and `acl.tf` to create the same extended ACL on two switches. It creates the ACL objects but does not attach them to an interface. The sample rules permit TCP/830 and TCP/22 from any source, then deny other IP traffic. Restrict the source addresses before using this outside an isolated lab.

### 3. Same ACL on the two lab switches ending in `.5` and `.55`

Folder: [`getting-started-examples/03-multi-device-acl`](getting-started-examples/03-multi-device-acl/)

Uses aliased provider configurations and one shared ACL definition to apply the same ACL to both switches. The checked-in variable template uses documentation-only sample IP addresses; enter your actual lab addresses in your local `terraform.tfvars`. Like example 2, the ACL is not attached to an interface, and its sample rules allow management traffic from any source.

## Terraform file types

- **`.tf` files** contain Terraform configuration: provider requirements, provider settings, input declarations, and resources. Filenames such as `main.tf`, `provider.tf`, `variables.tf`, and `acl.tf` are organizational conventions. Terraform combines all `.tf` files in the current example directory into one configuration.
- **`variables.tf`** conventionally holds `variable` blocks that declare the inputs a configuration accepts. The single-file VLAN example puts its declarations in `main.tf` to keep the example in one Terraform file.
- **`terraform.tfvars`** assigns actual values to declared variables. Terraform automatically loads this exact filename from the directory where you run the command. This is where you set your switch IPs or hostnames, username, and password so Terraform does not prompt for them.
- **`terraform.tfvars.example`** is a tracked template with documentation-only IPs and a password placeholder. It is not loaded automatically. Copy it to `terraform.tfvars`, then replace the marked values with your device IP/hostname, NETCONF username, and password.
- **`.terraform.lock.hcl`** records provider selections and checksums for consistent initialization. Commit this file if Terraform generates it for an example.
- **`terraform.tfstate`** tracks resources Terraform manages and can contain sensitive values. Keep it private. The `.terraform/` directory contains downloaded provider files and should not be committed.

The repository `.gitignore` excludes real `.tfvars` files, state, plans, and `.terraform/`. Marking a variable `sensitive = true` hides it from some CLI output, but does not remove it from state.

## Run an example

Run Terraform from the folder for the example you want. For example, for the VLAN:

```sh
cd getting-started-examples/01-vlan-single-file
cp terraform.tfvars.example terraform.tfvars
```

Open the copied `terraform.tfvars` and change the marked values:

- `switch_ip`: your switch management IP address or hostname
- `switch_username`: your NETCONF username (the template defaults to `admin`)
- `switch_password`: your device password

Then run:

```sh
terraform init
terraform fmt -check
terraform validate
terraform plan
```

For either ACL example, change into its folder and repeat the same commands. In examples 2 and 3, update both switch address fields, plus the username and password. The `.tfvars.example` file in each folder lists the exact input names.

Terraform reads `.tf` files only from the directory where you run it; it does not load `.tf` files from sibling or child folders. Run each example from its own folder so configurations and state do not get mixed.

On a first plan with empty state, expect one VLAN resource to add for example 1, or two ACL resources for examples 2 and 3. Existing state may instead show no changes or updates. Review the full plan and verify the target devices and values before `terraform apply`.

## Before and after verification on the switch CLI

Run the verification commands at the IOS XE switch prompt, before applying Terraform and again afterward. Save the before output so you can compare what changed. If a VLAN or ACL already exists, review its current settings and the Terraform plan before applying.

### Example 1: VLAN 500

Before `terraform apply`, check whether VLAN 500 already exists:

```text
Switch# show vlan id 500
```

After applying, run the same command. Confirm VLAN 500 is named `VLAN_500` and is active. Typical output includes:

```text
VLAN Name                             Status    Ports
---- -------------------------------- --------- -------------------------------
500  VLAN_500                         active
```

The exact spacing and port display can vary by IOS XE release. This example does not create an SVI, change the default gateway, or assign ports.

### Examples 2 and 3: management ACL

Before `terraform apply`, check the ACL on **each target switch** and save the current entries:

```text
Switch# show ip access-lists ACL_MGMT_INBOUND
```

After applying, run the same command on both switches. Confirm the sequence, action, protocol, and destination port match the planned ACL. Typical output is:

```text
Extended IP access list ACL_MGMT_INBOUND
    10 permit tcp any any eq 830
    20 permit tcp any any eq 22
    30 deny ip any any
```

Example 2 targets the two switch addresses you set as `switch1_host` and `switch2_host`. Example 3 targets the two lab switches ending in `.5` and `.55`, using values you set as `switch5_host` and `switch55_host`. The ACL resources are not attached to an interface, so these examples create the ACL definitions but do not apply filtering to interface traffic.

## Destroy and verify cleanup

When finished, run destroy from the same example directory and with the same local Terraform state:

```sh
terraform destroy
```

Review the destroy plan before confirming. Then rerun that example's switch verification command and compare it with the before output. Terraform removes resources tracked in that example's state; do not destroy a VLAN or ACL that other device configuration depends on.
