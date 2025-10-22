terraform {
  required_version = "~> 1.7"

  required_providers {
    fabric = {
      source  = "microsoft/fabric"
      version = ">= 1.6.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 3.6.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.70.0"
    }
  }
}
