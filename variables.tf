variable "railway_token" {
  description = "Token de acceso a Railway"
  type        = string
  sensitive   = true
}

variable "workspace_id" {
  description = "ID del workspace en Railway"
  type        = string
}

variable "project_id" {
  description = "ID del proyecto en Railway"
  type = string
}