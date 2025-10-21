terraform {
  required_version = "~> 1.7"

  required_providers {
    fabric = {
      source  = "microsoft/fabric"
      version = ">= 1.6.0"
    }
  }
}
