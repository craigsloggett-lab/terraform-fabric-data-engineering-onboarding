# terraform-fabric-data-engineering-onboarding
A Terraform module used to onboard Data Engineers to the Microsoft Fabric platform.

<!-- BEGIN_TF_DOCS -->
## Usage

```hcl
module "terraform_fabric_data_engineering_onboarding" {
  source  = "app.terraform.io/craigsloggett-lab/fabric/data-engineering-onboarding"
  version = "0.1.0"
}

# variables.tf



# providers.tf

provider "fabric" {
  preview = true
}

provider "azuread" {}
```

```hcl
# defaults.auto.tfvars


```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 3.6.0 |
| <a name="requirement_fabric"></a> [fabric](#requirement\_fabric) | >= 1.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | >= 3.6.0 |
| <a name="provider_fabric"></a> [fabric](#provider\_fabric) | >= 1.6.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [fabric_environment.this](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/environment) | resource |
| [fabric_lakehouse.bronze](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/lakehouse) | resource |
| [fabric_lakehouse.gold](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/lakehouse) | resource |
| [fabric_lakehouse.silver](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/lakehouse) | resource |
| [fabric_spark_custom_pool.this](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/spark_custom_pool) | resource |
| [fabric_spark_workspace_settings.this](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/spark_workspace_settings) | resource |
| [fabric_workspace.this](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/workspace) | resource |
| [fabric_workspace_git.github](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/workspace_git) | resource |
| [fabric_workspace_role_assignment.admins](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/workspace_role_assignment) | resource |
| [fabric_workspace_role_assignment.members](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/workspace_role_assignment) | resource |
| [azuread_group.fabric_workspace_admins](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_group.fabric_workspace_members](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [fabric_capacity.shared](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/data-sources/capacity) | data source |
| [fabric_connections.all](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/data-sources/connections) | data source |
| [terraform_remote_state.data_platform_shared_services](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_platform_shared_services_workspace_name"></a> [data\_platform\_shared\_services\_workspace\_name](#input\_data\_platform\_shared\_services\_workspace\_name) | The name of the HCP Terraform workspace managing the Data Platform shared infrastructure. | `string` | `"azure-fabric-shared-services"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment the Data Engineer is being onboarded to. | `string` | `"dev"` | no |
| <a name="input_fabric_environment_name"></a> [fabric\_environment\_name](#input\_fabric\_environment\_name) | The name of the Fabric environment being created. | `string` | `"env-banana-123000100101-233"` | no |
| <a name="input_fabric_lakehouse_name"></a> [fabric\_lakehouse\_name](#input\_fabric\_lakehouse\_name) | The name of the LakeHouse being created. | `string` | `"lh_banana_123000100101_233"` | no |
| <a name="input_fabric_spark_custom_pool_name"></a> [fabric\_spark\_custom\_pool\_name](#input\_fabric\_spark\_custom\_pool\_name) | The name of the Spark Custom Pool being created. | `string` | `"sprk-banana-123000100101-233"` | no |
| <a name="input_fabric_workspace_admin_group_display_names"></a> [fabric\_workspace\_admin\_group\_display\_names](#input\_fabric\_workspace\_admin\_group\_display\_names) | A set of Microsoft Entra ID group display names to assign the Fabric workspace Admin role to. | `set(string)` | <pre>[<br/>  "Data Platform Engineering"<br/>]</pre> | no |
| <a name="input_fabric_workspace_github_repository"></a> [fabric\_workspace\_github\_repository](#input\_fabric\_workspace\_github\_repository) | Configuration parameters for the GitHub repository backing the Fabric workspace. | <pre>object({<br/>    owner = string<br/>    name  = string<br/>  })</pre> | <pre>{<br/>  "name": "microsoft-fabric-workspaces",<br/>  "owner": "craigsloggett-lab"<br/>}</pre> | no |
| <a name="input_fabric_workspace_member_group_display_names"></a> [fabric\_workspace\_member\_group\_display\_names](#input\_fabric\_workspace\_member\_group\_display\_names) | A set of Microsoft Entra ID group display names to assign the Fabric workspace Member role to. | `set(string)` | <pre>[<br/>  "Data Engineering"<br/>]</pre> | no |
| <a name="input_fabric_workspace_name"></a> [fabric\_workspace\_name](#input\_fabric\_workspace\_name) | The name of the Fabric workspace being created. | `string` | `"ws-banana-123000100101-233"` | no |
| <a name="input_hcp_terraform_organization_name"></a> [hcp\_terraform\_organization\_name](#input\_hcp\_terraform\_organization\_name) | The name of the HCP Terraform organization to find shared remote state. | `string` | `"craigsloggett-lab"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->