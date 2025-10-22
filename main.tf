data "tfe_organization" "this" {
  name = var.hcp_terraform_organization_name
}

data "tfe_outputs" "data_platform_shared_services" {
  organization = data.tfe_organization.this.name
  workspace    = var.data_platform_shared_services_workspace_name
}

data "fabric_capacity" "shared" {
  display_name = data.tfe_outputs.data_platform_shared_services.values.fabric_capacity_names[var.environment]
}

data "azuread_group" "fabric_workspace_admins" {
  for_each     = var.fabric_workspace_admin_group_display_names
  display_name = each.key
}

data "azuread_group" "fabric_workspace_members" {
  for_each     = var.fabric_workspace_member_group_display_names
  display_name = each.key
}

resource "fabric_workspace" "this" {
  display_name = var.fabric_workspace_name
  description  = "Workspace created via Terraform"
  capacity_id  = data.fabric_capacity.shared.id
}

resource "fabric_workspace_role_assignment" "admins" {
  for_each     = data.azuread_group.fabric_workspace_admins
  workspace_id = fabric_workspace.this.id

  principal = {
    id   = each.value.object_id
    type = "Group"
  }
  role = "Admin"
}

resource "fabric_workspace_role_assignment" "members" {
  for_each     = data.azuread_group.fabric_workspace_members
  workspace_id = fabric_workspace.this.id

  principal = {
    id   = each.value.object_id
    type = "Group"
  }
  role = "Member"
}

resource "fabric_environment" "this" {
  display_name = var.fabric_environment_name
  description  = "Environment created via Terraform"
  workspace_id = fabric_workspace.this.id
}

resource "fabric_spark_custom_pool" "this" {
  name         = var.fabric_spark_custom_pool_name
  node_family  = "MemoryOptimized"
  node_size    = "Small"
  type         = "Workspace"
  workspace_id = fabric_workspace.this.id

  auto_scale = {
    enabled        = true
    min_node_count = 1
    max_node_count = 3
  }

  dynamic_executor_allocation = {
    enabled       = true
    min_executors = 1
    max_executors = 2
  }
}

resource "fabric_spark_workspace_settings" "this" {
  workspace_id = fabric_workspace.this.id

  automatic_log = {
    enabled = true
  }

  high_concurrency = {
    notebook_interactive_run_enabled = true
    notebook_pipeline_run_enabled    = true
  }

  environment = {
    name            = fabric_environment.this.display_name
    runtime_version = "1.3"
  }

  pool = {
    customize_compute_enabled = true

    default_pool = {
      name = fabric_spark_custom_pool.this.name
      type = "Workspace"
    }

    starter_pool = {
      max_executors  = "2"
      max_node_count = "1"
    }
  }

  job = {
    conservative_job_admission_enabled = true
    session_timeout_in_minutes         = "20"
  }
}

data "fabric_connections" "all" {}

resource "fabric_workspace_git" "github" {
  for_each = local.github_connection_ids

  workspace_id            = fabric_workspace.this.id
  initialization_strategy = "PreferWorkspace"

  git_provider_details = {
    git_provider_type = "GitHub"
    owner_name        = var.fabric_workspace_github_repository.owner
    repository_name   = var.fabric_workspace_github_repository.name
    branch_name       = "main"
    directory_name    = "/${fabric_workspace.this.display_name}"
  }

  git_credentials = {
    source        = "ConfiguredConnection"
    connection_id = each.key
  }
}

resource "fabric_lakehouse" "bronze" {
  display_name = "${var.fabric_lakehouse_name}_bronze"
  workspace_id = fabric_workspace.this.id
}

resource "fabric_lakehouse" "silver" {
  display_name = "${var.fabric_lakehouse_name}_silver"
  workspace_id = fabric_workspace.this.id
}

resource "fabric_lakehouse" "gold" {
  display_name = "${var.fabric_lakehouse_name}_gold"
  workspace_id = fabric_workspace.this.id
}
