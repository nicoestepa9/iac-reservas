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
  type        = string
}

variable "environment_id" {
  description = ""
  type        = string
  sensitive   = true

}

# Variables de entorno para el servicio API
variable "BASE_URL" {
  description = "URL base de la API"
  type        = string
}

variable "MYSQL_DATABASE" {
  description = "Nombre de la base de datos MySQL"
  type        = string
}

variable "MYSQLHOST" {
  description = "Host del servidor MySQL"
  type        = string
}

variable "MYSQLPASSWORD" {
  description = "Contraseña de la base de datos MySQL"
  type        = string
  sensitive   = true
}

variable "MYSQLPORT" {
  description = "Puerto de conexión a MySQL"
  type        = string
}

variable "MYSQLUSER" {
  description = "Usuario de la base de datos MySQL"
  type        = string
}

variable "NODE_ENV" {
  description = "Entorno de ejecución de Node.js"
  type        = string
}

variable "PORT" {
  description = "Puerto donde corre la aplicación"
  type        = string
}

variable "RABBITMQ_URL" {
  description = "URL de conexión a RabbitMQ"
  type        = string
  sensitive   = true
}
