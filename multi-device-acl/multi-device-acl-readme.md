# Manage one extended ACL on two Cisco IOS XE switches

This example uses Terraform and NETCONF to create the same named extended ACL on two independently addressable switches. It defines the ACL entries once in a local value, then passes them to one resource per switch.

> **Choose your devices:** This example needs two independently addressable IOS XE switches. The prepared Catalyst 9300 sandbox workflow in the root guide is a single-switch example; use this example only if your reservation provides a second independent switch too. For your own devices, create `terraform.tfvars` from `terraform.tfvars.example` and replace both host addresses and the shared username and password. The real `terraform.tfvars` file is ignored by Git and is not included in a fresh clone.

## Goal

Create `ACL_MGMT_INBOUND` on both switches, read back its entries, verify the result with IOS XE CLI commands, then remove the ACLs created by this example.

## What Terraform changes

| Item | Behavior |
| --- | --- |
| Provider | `CiscoDevNet/iosxe` `~> 1.1.1`, using NETCONF over SSH on TCP/830 |
| Provider aliases | `iosxe.switch1` and `iosxe.switch2` target the two configured switches |
| Shared entries | A `local` value defines the ACL entries once for both resources |
| Resources | Create `ACL_MGMT_INBOUND` on each switch |
| Data sources | Read the ACL entries from each switch after the resource is created |
| Not included | The ACL is not applied to an interface, so it does not filter traffic in this example |

The sample rules permit TCP/830 and TCP/22 from any source, then deny all other IP traffic. They are intended for an isolated lab. Restrict source addresses before using an ACL like this in a real network. Do not attach it to an interface as written.

Provider references: [`iosxe_access_list_extended` resource](https://registry.terraform.io/providers/CiscoDevNet/iosxe/1.1.1/docs/resources/access_list_extended) · [`iosxe_access_list_extended` data source](https://registry.terraform.io/providers/CiscoDevNet/iosxe/1.1.1/docs/data-sources/access_list_extended).

## Before you start

- Terraform CLI `>= 1.3.0`
- Two independently addressable Cisco IOS XE switches with NETCONF enabled (`netconf-yang`) and reachable on TCP/830
- A NETCONF account with permission to read and configure ACLs on both switches
- The management IP or hostname, username, and password for each switch; this example uses one shared username and password

Create a local `terraform.tfvars` file in this folder with your two switch addresses and credentials. Terraform automatically loads a file with that exact name. If you want to start from the tracked template, copying it is optional:

```sh
cp terraform.tfvars.example terraform.tfvars
```

Set these values from your reservation or devices:

| Variable | Value to set |
| --- | --- |
| `switch1_host` | Management IP or hostname of switch 1 |
| `switch2_host` | Management IP or hostname of switch 2 |
| `switch_username` | NETCONF username used on both switches |
| `switch_password` | Password used on both switches |

Git ignores `terraform.tfvars`, so credentials are not committed. Terraform still reads the file normally. The `.example` template is tracked by Git and is not loaded automatically.

## 1. Check both switches first

On **each switch**, check whether the ACL name already exists and review its current entries:

```text
Switch# show ip access-lists ACL_MGMT_INBOUND
```

If the ACL already exists, choose a new unused name and update the `name` in both resources and both data sources in `acl.tf`. Do not apply this example to an ACL that existed before this Terraform run or is referenced by other configuration. This example creates the ACL object only; it does not attach it to an interface.

> **Important:** `terraform destroy --auto-approve` deletes the ACL resources managed by this folder without an interactive confirmation prompt. Do not destroy an ACL that existed before this run or is used elsewhere.

## 2. Plan and apply

Run Terraform from this folder. Terraform combines `.tf` files in the current directory; it does not load `.tf` files from sibling example folders.

Initialize the working directory and install the provider version selected by this example:

```sh
terraform init
```

Then validate the configuration and preview the changes:

```sh
terraform validate
terraform plan
```

With an empty Terraform state, expect two ACL resources to be added. The data sources depend on their corresponding resources, so Terraform defers their first read until apply creates the ACLs. Use the CLI pre-check in step 1 to confirm the name is unused before applying. Check the target addresses and the ACL entries in the plan.

After reviewing the plan, apply without an interactive confirmation prompt:

```sh
terraform apply --auto-approve
```

After Terraform creates the ACLs, it reads each one through its data source. Inspect the readback outputs with:

```sh
terraform output switch1_acl_observed
terraform output switch2_acl_observed
```

## 3. Verify the result

On **each switch**, read the ACL from the device:

```text
Switch# show ip access-lists ACL_MGMT_INBOUND
```

The relevant output should look like this:

```text
Extended IP access list ACL_MGMT_INBOUND
    10 permit tcp any any eq 830
    20 permit tcp any any eq 22
    30 deny ip any any
```

This expected CLI output shows the ACL object and entries. Compare it with the actual output from both devices and the Terraform data-source outputs. The ACL is not attached to an interface, so it does not filter interface traffic.

## 4. Clean up

If this Terraform run created both ACLs and nothing else depends on them, remove them:

```sh
terraform destroy --auto-approve
```

Then run the show command on both switches again:

```text
Switch# show ip access-lists ACL_MGMT_INBOUND
```

Confirm the ACL created for this example is no longer listed. Do not destroy an ACL that existed before this run or is used elsewhere.

## Files in this folder

- `provider.tf` — provider requirement and the two aliased provider configurations.
- `variables.tf` — declares the two device addresses and shared credentials.
- `acl.tf` — defines the shared ACL entries, one resource and one readback data source per switch, and outputs for the observed entries.
- `terraform.tfvars.example` — tracked template for local switch connection values. You can copy it to `terraform.tfvars` or create that file yourself; Terraform auto-loads `terraform.tfvars`, and Git ignores it.
- `.terraform.lock.hcl` — generated by `terraform init`; it records the selected provider version.
