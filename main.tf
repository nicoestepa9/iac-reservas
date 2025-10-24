terraform {
  required_providers {
    railway = {
      source  = "terraform-community-providers/railway"
      version = "0.5.1" # Usa la última versión disponible
    }
  }
}

provider "railway" {
  token = var.railway_token
}

resource "railway_service" "mi_servicio" {
  project_id = var.project_id
  name       = "mi-servicio"
}
