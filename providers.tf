terraform {
  required_version = ">= 1.5.0"

  required_providers {
    railway = {
      source  = "terraform-community-providers/railway"
      version = "0.5.1" # o la última disponible
    }
  }
}

provider "railway" {
  token = var.railway_token
}

