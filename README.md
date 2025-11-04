# terraform-fabric-data-engineering-onboarding
A Terraform module used to onboard Data Engineers to the Microsoft Fabric platform.

<!-- BEGIN_TF_DOCS -->
## Usage

```hcl
# main.tf

module "terraform_fabric_data_engineering_onboarding" {
  source  = "app.terraform.io/craigsloggett-lab/data-engineering-onboarding/fabric"
  version = "0.5.2"

  environment                   = var.environment
  fabric_workspace_name         = var.fabric_workspace_name
  fabric_environment_name       = var.fabric_environment_name
  fabric_spark_custom_pool_name = var.fabric_spark_custom_pool_name
  fabric_lakehouse_name         = var.fabric_lakehouse_name
}

# variables.tf

variable "environment" {
  type        = string
  description = "The environment the Data Engineer is being onboarded to."
}

variable "fabric_workspace_name" {
  type        = string
  description = "The name of the Fabric workspace being created."
}

variable "fabric_environment_name" {
  type        = string
  description = "The name of the Fabric environment being created."
}

variable "fabric_spark_custom_pool_name" {
  type        = string
  description = "The name of the Spark Custom Pool being created."
}

variable "fabric_lakehouse_name" {
  type        = string
  description = "The name of the LakeHouse being created."
}

# providers.tf

provider "fabric" {
  preview = true
}

provider "azuread" {}

provider "tfe" {}

# inputs.auto.tfvars

environment                   = "dev"
fabric_workspace_name         = "data-engineering-001"
fabric_environment_name       = "data-engineering-001"
fabric_spark_custom_pool_name = "data-engineering-001"
fabric_lakehouse_name         = "data_engineering_001"
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 3.6.0 |
| <a name="requirement_fabric"></a> [fabric](#requirement\_fabric) | >= 1.6.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | >= 3.6.0 |
| <a name="provider_fabric"></a> [fabric](#provider\_fabric) | >= 1.6.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | >= 0.70.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [fabric_copy_job.blobstorage_to_bronze_lakehouse](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/copy_job) | resource |
| [fabric_environment.this](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/environment) | resource |
| [fabric_lakehouse.bronze](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/lakehouse) | resource |
| [fabric_lakehouse.gold](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/lakehouse) | resource |
| [fabric_lakehouse.silver](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/lakehouse) | resource |
| [fabric_lakehouse.stone](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/lakehouse) | resource |
| [fabric_spark_custom_pool.this](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/spark_custom_pool) | resource |
| [fabric_spark_workspace_settings.this](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/spark_workspace_settings) | resource |
| [fabric_workspace.this](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/workspace) | resource |
| [fabric_workspace_git.github](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/workspace_git) | resource |
| [fabric_workspace_role_assignment.admins](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/workspace_role_assignment) | resource |
| [fabric_workspace_role_assignment.members](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/resources/workspace_role_assignment) | resource |
| [terraform_data.fabric_workspace_git_create_directory](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [azuread_group.fabric_workspace_admins](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_group.fabric_workspace_members](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [fabric_capacity.shared](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/data-sources/capacity) | data source |
| [fabric_connections.all](https://registry.terraform.io/providers/microsoft/fabric/latest/docs/data-sources/connections) | data source |
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization) | data source |
| [tfe_outputs.data_platform_shared_services](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_platform_shared_services_workspace_name"></a> [data\_platform\_shared\_services\_workspace\_name](#input\_data\_platform\_shared\_services\_workspace\_name) | The name of the HCP Terraform workspace managing the Data Platform shared infrastructure. | `string` | `"azure-fabric-shared-services"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment the Data Engineer is being onboarded to. | `string` | n/a | yes |
| <a name="input_fabric_environment_name"></a> [fabric\_environment\_name](#input\_fabric\_environment\_name) | The name of the Fabric environment being created. | `string` | n/a | yes |
| <a name="input_fabric_lakehouse_name"></a> [fabric\_lakehouse\_name](#input\_fabric\_lakehouse\_name) | The name of the Lakehouse being created. | `string` | n/a | yes |
| <a name="input_fabric_spark_custom_pool_name"></a> [fabric\_spark\_custom\_pool\_name](#input\_fabric\_spark\_custom\_pool\_name) | The name of the Spark Custom Pool being created. | `string` | n/a | yes |
| <a name="input_fabric_workspace_admin_group_display_names"></a> [fabric\_workspace\_admin\_group\_display\_names](#input\_fabric\_workspace\_admin\_group\_display\_names) | A set of Microsoft Entra ID group display names to assign the Fabric workspace Admin role to. | `set(string)` | <pre>[<br/>  "Data Platform Engineering"<br/>]</pre> | no |
| <a name="input_fabric_workspace_github_repository"></a> [fabric\_workspace\_github\_repository](#input\_fabric\_workspace\_github\_repository) | Configuration parameters for the GitHub repository backing the Fabric workspace. | <pre>object({<br/>    owner = string<br/>    name  = string<br/>  })</pre> | <pre>{<br/>  "name": "microsoft-fabric-workspaces",<br/>  "owner": "craigsloggett-lab"<br/>}</pre> | no |
| <a name="input_fabric_workspace_member_group_display_names"></a> [fabric\_workspace\_member\_group\_display\_names](#input\_fabric\_workspace\_member\_group\_display\_names) | A set of Microsoft Entra ID group display names to assign the Fabric workspace Member role to. | `set(string)` | <pre>[<br/>  "Data Engineering"<br/>]</pre> | no |
| <a name="input_fabric_workspace_name"></a> [fabric\_workspace\_name](#input\_fabric\_workspace\_name) | The name of the Fabric workspace being created. | `string` | n/a | yes |
| <a name="input_hcp_terraform_organization_name"></a> [hcp\_terraform\_organization\_name](#input\_hcp\_terraform\_organization\_name) | The name of the HCP Terraform organization to find shared remote state. | `string` | `"craigsloggett-lab"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->