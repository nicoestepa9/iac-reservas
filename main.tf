/*
main.tf

Minimal Terraform starter for managing a Railway project via the Railway Terraform provider.
Fill the variables below and install the provider from the Terraform Registry before applying.

Notes:
- Replace provider version with the latest from https://registry.terraform.io
- This is a template: adjust resources/fields to match the provider version you install.
*/

terraform {
    required_providers {
        railway = {
            source  = "railway/railway"
            version = ">= 0.1.0"
        }
    }
    required_version = ">= 1.0.0"
}

provider "railway" {
    # Provide your Railway token via TF_VAR_railway_token or set it here
    # e.g. export TF_VAR_railway_token="your-token"
    token = var.railway_token
}

variable "railway_token" {
    description = "Railway API token. You can export as TF_VAR_railway_token or set in a secrets manager."
    type        = string
    sensitive   = true
}

variable "project_name" {
    description = "Name for the Railway project to create/manage"
    type        = string
    default     = "my-railway-project"
}

variable "environment_name" {
    description = "Environment name (e.g. production, staging)"
    type        = string
    default     = "production"
}

variable "service_name" {
    description = "Service name (your app/service in Railway)"
    type        = string
    default     = "web"
}

variable "database_url" {
    description = "Optional: initial DATABASE_URL value to set as an environment variable in Railway"
    type        = string
    default     = ""
    sensitive   = true
}

# Create or manage a Railway project
resource "railway_project" "app" {
    name        = var.project_name
    description = "Managed by Terraform"
}

# Create an environment within the project
resource "railway_environment" "env" {
    project = railway_project.app.id
    name    = var.environment_name
}

# Create a service (app) within the project + environment
resource "railway_service" "service" {
    project     = railway_project.app.id
    environment = railway_environment.env.id
    name        = var.service_name
    # More fields can be provided depending on the provider version (e.g., service type, repo, region)
}

# Optional: set an environment variable (DATABASE_URL) for the service environment
# Field names vary by provider version; adapt if necessary.
resource "railway_variable" "database" {
    project     = railway_project.app.id
    environment = railway_environment.env.id
    key         = "DATABASE_URL"
    value       = var.database_url
    # If the provider requires a service association, add it (e.g., service = railway_service.service.id)
    # Set value only if provided
    lifecycle {
        ignore_changes = [
            # Avoid forced changes if value is empty; adjust as needed
            value
        ]
    }

    count = var.database_url != "" ? 1 : 0
}

output "project_id" {
    value = railway_project.app.id
    description = "Railway project id"
}

output "environment_id" {
    value = railway_environment.env.id
    description = "Railway environment id"
}

output "service_id" {
    value = railway_service.service.id
    description = "Railway service id"
}