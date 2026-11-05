# Cisco IOS XE Terraform NETCONF Examples

Three independent getting-started examples for managing Cisco IOS XE with Terraform over NETCONF. Each example is its own Terraform root module with a separate working directory and local state.

## Requirements

- Terraform CLI `>= 1.3.0`
- Cisco IOS XE devices with NETCONF enabled (`netconf-yang`) and reachable over SSH on port 830
- CiscoDevNet/iosxe provider `~> 1.1.1`; provider v1.x uses NETCONF only
- A local `terraform.tfvars` file with your device connection values

## Examples

### 1. VLAN on one switch, all Terraform configuration in one file

Folder: [`getting-started-examples/01-vlan-single-file`](getting-started-examples/01-vlan-single-file/)

Creates a Layer 2 VLAN using the ID and name in `terraform.tfvars`. Choose an ID that is not already configured on the switch. It does not create an SVI, change a default gateway, or assign a switchport to the VLAN. Provider configuration, variable declarations, resource, data source, and output are together in `main.tf`.

### 2. Same ACL on two switches, standard split files

Folder: [`getting-started-examples/02-acl-multi-device`](getting-started-examples/02-acl-multi-device/)

Uses `provider.tf`, `variables.tf`, and `acl.tf` to create the same extended ACL on two switches. It creates the ACL objects but does not attach them to an interface. The sample rules permit TCP/830 and TCP/22 from any source, then deny other IP traffic. Restrict the source addresses before using this outside an isolated lab.

Set `acl_name` in your local `terraform.tfvars` to a name that is not already configured on either switch.

### 3. Same ACL on the two lab switches ending in `.5` and `.55`

Folder: [`getting-started-examples/03-multi-device-acl`](getting-started-examples/03-multi-device-acl/)

Uses aliased provider configurations and one shared ACL definition to apply the same ACL to both switches. The checked-in variable template uses documentation-only sample IP addresses; enter your actual lab addresses in your local `terraform.tfvars`. Like example 2, the ACL is not attached to an interface, and its sample rules allow management traffic from any source.

Set `acl_name` in your local `terraform.tfvars` to a name that is not already configured on either switch.

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
- `vlan_id` and `vlan_name`: choose an unused ID after checking `show vlan brief`

Then run:

```sh
terraform init
terraform fmt -check
terraform validate
terraform plan -out=reviewed.tfplan
terraform show reviewed.tfplan
terraform apply --auto-approve reviewed.tfplan
terraform plan
```

The saved plan reads the configured VLAN ID before creating it. Review it with `terraform show` before applying. Passing a saved plan is Terraform's approval, so it ignores `--auto-approve` in this mode. After apply, the second plan reads the same ID again and should show its current name and state through the data source. If the ID already exists, choose a different unused ID and update its name before applying. Keep saved plan files private; they can contain sensitive values.

For either ACL example, change into its folder and repeat the same commands. In examples 2 and 3, update both switch address fields, the username and password, and `acl_name`. Check that the ACL name is unused on both devices. The `.tfvars.example` file in each folder lists the exact input names.

Terraform reads `.tf` files only from the directory where you run it; it does not load `.tf` files from sibling or child folders. Run each example from its own folder so configurations and state do not get mixed.

On a first plan with empty state, expect one VLAN resource to add for example 1, or two ACL resources for examples 2 and 3. Existing state may instead show no changes or updates. Review the full plan and verify the target devices and values before apply.

## Verify and clean up

For the VLAN example, verify on the switch using your selected VLAN ID:

```text
show vlan id <VLAN_ID>
```

For either ACL example, verify on each switch using the ACL name you set in `terraform.tfvars`:

```text
show ip access-lists <ACL_NAME>
```

When finished, run destroy from the same example directory, using the same local state:

```sh
terraform destroy --auto-approve
```

Before running destroy, confirm you are in the correct example folder and that its state contains only the lab resources. This removes resources recorded in that example's state. Do not destroy a VLAN or ACL that other device configuration depends on.
