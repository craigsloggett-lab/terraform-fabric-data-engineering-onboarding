variable "hcp_terraform_organization_name" {
  type        = string
  description = "The name of the HCP Terraform organization to find shared remote state."
  default     = "craigsloggett-lab"
}

variable "data_platform_shared_services_workspace_name" {
  type        = string
  description = "The name of the HCP Terraform workspace managing the Data Platform shared infrastructure."
  default     = "azure-fabric-shared-services"
}

variable "fabric_workspace_admin_group_display_names" {
  type        = set(string)
  description = "A set of Microsoft Entra ID group display names to assign the Fabric workspace Admin role to."
  default     = ["Data Platform Engineering"]
}

variable "fabric_workspace_member_group_display_names" {
  type        = set(string)
  description = "A set of Microsoft Entra ID group display names to assign the Fabric workspace Member role to."
  default     = ["Data Engineering"]
}

variable "fabric_workspace_github_repository" {
  type = object({
    owner = string
    name  = string
  })
  description = "Configuration parameters for the GitHub repository backing the Fabric workspace."
  default = {
    owner = "craigsloggett-lab"
    name  = "microsoft-fabric-workspaces"
  }
}

# Input Parameters

variable "environment" {
  type        = string
  description = "The environment the Data Engineer is being onboarded to."

  validation {
    condition     = var.environment == "dev"
    error_message = "The environment must be set to 'dev'."
  }
}

variable "fabric_workspace_name" {
  type        = string
  description = "The name of the Fabric workspace being created."

  validation {
    condition     = can(regex("^ws-", var.fabric_workspace_name))
    error_message = "The Fabric workspace name must start with 'ws-'."
  }

  validation {
    condition     = !can(regex("_", var.fabric_workspace_name))
    error_message = "The Fabric workspace name must not contain underscores '_', use dashes instead '-'."
  }
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
