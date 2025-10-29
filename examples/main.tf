module "terraform_fabric_data_engineering_onboarding" {
  source  = "app.terraform.io/craigsloggett-lab/data-engineering-onboarding/fabric"
  version = "0.3.4"

  environment                   = var.environment
  fabric_workspace_name         = var.fabric_workspace_name
  fabric_environment_name       = var.fabric_environment_name
  fabric_spark_custom_pool_name = var.fabric_spark_custom_pool_name
  fabric_lakehouse_name         = var.fabric_lakehouse_name
}
