terraform {
  cloud {
    organization = "oatmeal-monster-cloud"

    workspaces {
      name = "terraform-backend"
    }
  }
}
