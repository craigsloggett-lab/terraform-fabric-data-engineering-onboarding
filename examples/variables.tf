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
