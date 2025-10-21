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

variable "environment" {
  type        = string
  description = "The environment the Data Engineer is being onboarded to."
  default     = "dev"
}

