# iosxe_cli provider example

This folder contains a single-device Terraform example for `iosxe_cli` from CiscoDevNet/iosxe v1.1.1. The files follow the same run sequence as the worked VLAN example. They are based on the provider release example and have **not** been individually tested against a sandbox or every IOS XE platform.

## Goal

Use the `iosxe_cli` resource to manage the configuration shown in [`resource.tf`](resource.tf) on one IOS XE device. Read that file before running Terraform: the sample values may affect live device behavior and may need to be replaced with values appropriate for your reservation.

## Sandbox and connection requirements

- Terraform CLI `>= 1.3.0` and CiscoDevNet/iosxe provider `~> 1.1.1` (NETCONF only).
- IOS XE with NETCONF enabled and reachable from your computer over TCP/830.
- A sandbox model and IOS XE release that support this feature. The Catalyst 9300 reservation used by the repository walkthrough is not guaranteed to support every provider resource.
- A NETCONF account with permission to read and configure this feature.
- Use the reservation IP and credentials in this folder’s local `terraform.tfvars`. Change the template values for your reservation; never commit real credentials.

Create `terraform.tfvars` from the tracked template if you have not already done so:

```sh
cp terraform.tfvars.example terraform.tfvars
```

## 1. Check the device before Terraform

Connect to the switch CLI and capture the current configuration before making changes. This read-only command works across IOS XE features:

```text
Switch# show running-config
```

Find the configuration stanza affected by `iosxe_cli` and compare it with [`resource.tf`](resource.tf). If you know the exact stanza, IOS XE can narrow the output with `show running-config | section <stanza>`; replace `<stanza>` with the relevant heading. Also consult the linked feature documentation for an operational `show` command where one is available. Save the before output so you can compare it after apply and destroy.

This resource has no matching data source in provider v1.1.1. Use the CLI output as the before/after verification for this example.

## 2. Initialize, plan, and apply

Run these commands from this folder. Terraform loads the `.tf` files here and keeps this example’s state here; it does not load sibling folders.

```sh
terraform init
terraform validate
terraform plan
```

Review the full plan. Confirm the device address, resource values, and all planned additions, changes, replacements, or deletions. Stop if the sample does not match your sandbox or if the change is unexpected.

After reviewing the plan, apply it:

```sh
terraform apply --auto-approve
```

## 3. Verify after apply

Run the CLI check again and compare the affected configuration with your saved before output:

```text
Switch# show running-config
```

Confirm that the stanza described by `iosxe_cli` reflects the values in [`resource.tf`](resource.tf). Use the feature-specific operational `show` command from the provider reference when one is documented; the running configuration confirms configured values, while an operational command can confirm device status.

## 4. Destroy and verify cleanup

This resource performs an imperative or save operation. Destroy is not a reliable rollback for commands already sent or configuration already saved. Do not run a generic destroy expecting the device to return to its prior state. Follow the provider resource documentation and restore the specific configuration manually, then compare `show running-config` with your saved before output.

## References

- [Provider v1.1.1 resource documentation](https://registry.terraform.io/providers/CiscoDevNet/iosxe/1.1.1/docs/resources/cli)
- [Official v1.1.1 resource example source](https://github.com/CiscoDevNet/terraform-provider-iosxe/tree/v1.1.1/examples/resources/iosxe_cli)
- [Provider NETCONF guide](https://registry.terraform.io/providers/CiscoDevNet/iosxe/1.1.1/docs/guides/netconf)
