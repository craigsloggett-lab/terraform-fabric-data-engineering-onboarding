data "terraform_remote_state" "data_platform_shared_services" {
  backend = "remote"

  config = {
    organization = var.hcp_terraform_organization_name
    workspaces = {
      name = var.data_platform_shared_services_workspace_name
    }
  }
}

data "fabric_capacity" "shared" {
  display_name = data.terraform_remote_state.data_platform_shared_services.outputs.fabric_capacity_names[var.environment]
}

resource "fabric_workspace" "data_engineering" {
  #display_name = "ws-${local.base_name}-${var.environment_name}" # Needs to be unique, use the random provider
  display_name = "ws-banana-1000123-344444"
  description  = "Workspace created via Terraform"
  capacity_id  = data.fabric_capacity.shared.id
}
