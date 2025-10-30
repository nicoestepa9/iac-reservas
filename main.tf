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
  source_repo_branch="main"
}

resource "railway_service" "front" {
  project_id = var.project_id
  name       = "front"
  source_repo="IgnaBilli/ReservasAirFront"
  source_repo_branch="main"
}

/*resource "railway_service" "db" {
  project_id = var.project_id
  name = "mysql-db"
  template = "mysql"
  source_repo_branch="main"
}*/


resource "railway_variable_collection" "api_env" {
  service_id = railway_service.api.id
  environment_id = var.environment_id

  variables = [
    {
      name = "BASE_URL"   
      value = var.BASE_URL
    },
    {
      name = "MYSQL_DATABASE" 
      value = var.MYSQL_DATABASE
    },
    {
      name = "MYSQLHOST"     
      value = var.MYSQLHOST
    },
    {
      name = "MYSQLPASSWORD"  
      value = var.MYSQLPASSWORD
    },
    {
      name = "MYSQLPORT"     
      value = var.MYSQLPORT
    },
    {
      name = "MYSQLUSER"     
      value = var.MYSQLUSER
    },
    {
      name = "NODE_ENV"      
      value = var.NODE_ENV
    },
    {
      name = "PORT"          
      value = var.PORT
    },
    {
      name = "RABBITMQ_URL"  
      value = var.RABBITMQ_URL
  }]
}
