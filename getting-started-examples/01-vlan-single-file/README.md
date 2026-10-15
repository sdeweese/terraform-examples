# Create a VLAN (Single File)

This example puts the provider, input variables, and resource in one Terraform file: [`main.tf`](main.tf). It creates a Layer 2 VLAN on a Cisco IOS XE switch over NETCONF.

It does not configure an SVI, change a default gateway, or assign a switchport to the VLAN.

## Before you run it

- Use an IOS XE switch with NETCONF enabled (`netconf-yang`) and reachable over SSH on port 830.
- This example creates VLAN `500` named `VLAN_500`. Edit those values in `main.tf` if your lab needs different values.
- The provider version is pinned to `0.15.x` because that release line uses NETCONF by default. Provider versions before `0.15.0` default to RESTCONF.
- Do not put a real password in `main.tf`. Supply it through a local, untracked `terraform.tfvars` file.

## Configure local values

Copy [`terraform.tfvars.example`](terraform.tfvars.example) to `terraform.tfvars`. In the copied file, change `switch_ip` to your switch management IP or hostname, `switch_username` to your NETCONF username, and `switch_password` to your device password. The values in the example are placeholders:

```hcl
switch_ip       = "192.0.2.10"
switch_username = "admin"
switch_password = "your-local-device-password"
```

Terraform automatically loads `terraform.tfvars` from this directory, so `terraform plan` will not prompt for these inputs. The local file is ignored by Git; never put a real password in `main.tf` or commit the local `.tfvars` file.

```sh
cp terraform.tfvars.example terraform.tfvars
```

## Run

From this directory:

```sh
terraform init
terraform fmt -check
terraform validate
terraform plan
```

Review the plan before running `terraform apply`. Terraform state can contain sensitive values; keep the generated state file private. Do not destroy a VLAN that is in use by other switch configuration.

## Verify on the switch

```text
show vlan id 500
```
