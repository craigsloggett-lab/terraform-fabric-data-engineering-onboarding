terraform {
  cloud {
    organization = "craigsloggett-lab"

    workspaces {
      project = "Modules"
      name    = "terraform-fabric-data-engineering-onboarding"
    }
  }
}
