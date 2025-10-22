variables {
  environment                   = "dev"
  fabric_workspace_name         = "ws-banana-123000100101-233"
  fabric_environment_name       = "env-banana-123000100101-233"
  fabric_spark_custom_pool_name = "sprk-banana-123000100101-233"
  fabric_lakehouse_name         = "lh_banana_123000100101_233"
}

run "validate" {
  command = plan
}
