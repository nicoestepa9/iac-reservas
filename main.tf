# Proyecto Railway de prueba
resource "railway_project" "test_project" {
  name        = "terraform-test-api"
  description = "Proyecto de prueba creado con Terraform"
}

# Servicio dentro del proyecto
resource "railway_service" "api_service" {
  project_id = railway_project.test_project.id
  name       = "api-test-service"
  template   = "node"

  variables = {
    PORT = "8080"
  }
}
