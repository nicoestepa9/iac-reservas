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

resource "railway_service" "api" {
  project_id = var.project_id
  name       = "api"
  source_repo= "BackendOrganization/ReservasAirBack"
}

resource "railway_service" "front" {
  project_id = var.project_id
  name       = "front"
  source_repo="IgnaBilli/ReservasAirFront"
}

/*resource "railway_service" "db" {
  project_id = var.project_id
  name = "mysql-db"
  template = "mysql"
}*/
