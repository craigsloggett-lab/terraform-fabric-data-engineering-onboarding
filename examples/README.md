

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 3.6.0 |
| <a name="requirement_fabric"></a> [fabric](#requirement\_fabric) | 1.6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_terraform_fabric_data_engineering_onboarding"></a> [terraform\_fabric\_data\_engineering\_onboarding](#module\_terraform\_fabric\_data\_engineering\_onboarding) | app.terraform.io/craigsloggett-lab/data-engineering-onboarding/fabric | 0.1.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment the Data Engineer is being onboarded to. | `string` | n/a | yes |
| <a name="input_fabric_environment_name"></a> [fabric\_environment\_name](#input\_fabric\_environment\_name) | The name of the Fabric environment being created. | `string` | n/a | yes |
| <a name="input_fabric_lakehouse_name"></a> [fabric\_lakehouse\_name](#input\_fabric\_lakehouse\_name) | The name of the LakeHouse being created. | `string` | n/a | yes |
| <a name="input_fabric_spark_custom_pool_name"></a> [fabric\_spark\_custom\_pool\_name](#input\_fabric\_spark\_custom\_pool\_name) | The name of the Spark Custom Pool being created. | `string` | n/a | yes |
| <a name="input_fabric_workspace_name"></a> [fabric\_workspace\_name](#input\_fabric\_workspace\_name) | The name of the Fabric workspace being created. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->