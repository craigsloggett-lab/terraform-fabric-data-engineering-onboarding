# terraform-fabric-data-engineering-onboarding
A Terraform module used to onboard Data Engineers to the Microsoft Fabric platform.

<!-- BEGIN_TF_DOCS -->
## Usage

```hcl
module "terraform_fabric_data_engineering_onboarding" {
  source = "git::https://github.com/craigsloggett-lab/terraform-fabric-data-engineering-onboarding.git?ref=add-fabric-resources"
}

# variables.tf



# providers.tf

provider "fabric" {
  preview = true
}
```

```hcl
# defaults.auto.tfvars


```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_fabric"></a> [fabric](#requirement\_fabric) | >= 1.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_fabric"></a> [fabric](#provider\_fabric) | >= 1.6.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [fabric_workspace.data_engineering](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/workspace) | resource |
| [fabric_capacity.shared](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/data-sources/capacity) | data source |
| [terraform_remote_state.data_platform_shared_services](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_platform_shared_services_workspace_name"></a> [data\_platform\_shared\_services\_workspace\_name](#input\_data\_platform\_shared\_services\_workspace\_name) | The name of the HCP Terraform workspace managing the Data Platform shared infrastructure. | `string` | `"azure-fabric-shared-services"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment the Data Engineer is being onboarded to. | `string` | `"dev"` | no |
| <a name="input_hcp_terraform_organization_name"></a> [hcp\_terraform\_organization\_name](#input\_hcp\_terraform\_organization\_name) | The name of the HCP Terraform organization to find shared remote state. | `string` | `"craigsloggett-lab"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->