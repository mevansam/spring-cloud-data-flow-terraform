#
# Module inputs
#

variable "org_name" {
  description = "The organization to which Spring Cloud Data Flow should be deployed to."
  type        = "string"
}

variable "space_name" {
  description = "The space to which Spring Cloud Data Flow should be deployed to."
  type        = "string"
}

variable "root_domain_name" {
  description = "The root domain to use when mapping routes."
  type        = "string"
}

variable "scdf_redis_plan" {
  description = "The Redis service plan to use for SCDF. The default is 'shared'."
  type        = "string"
  default     = "shared-vm"
}

variable "scdf_rabbitmq_plan" {
  description = "The RabbitMQ service plan to use for SCDF. The default is 'standard'."
  type        = "string"
  default     = "standard"
}

variable "scdf_mysql_plan" {
  description = "The MySQL service plan to use for SCDF. The default is '100mb'."
  type        = "string"
  default     = "100mb"
}

variable "scdf_server_version" {
  description = "The version of the Spring Cloud Data Flow server to deploy."
  type        = "string"
  default     = "1.2.0"
}

variable "num_server_instances" {
  default = 1
}

variable "route_postfix" {
  description = "A name to postfix the server hostname with to create a unique route to the Spring Cloud Data Flow server."
}
