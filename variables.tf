variable "env" {
  description = "The environment to deploy to"
  type        = string
  default     = "DEV"
}

variable "enforce_style" {
  description = "Whether to enforce the naming convention"
  type        = bool
  default     = true
}

variable "create_database" {
  description = "Whether to create the database"
  type        = bool
  default     = true
}

variable "databases" {
  description = "A map of databases to create"
  type = map(object({
    name                        = string
    comment                     = optional(string)
    data_retention_time_in_days = optional(number)
    is_transient                = optional(bool)
  }))
  default = {}
}

variable "create_warehouse" {
  description = "Whether to create the warehouse"
  type        = bool
  default     = true
}

variable "warehouses" {
  description = "A map of warehouses to create"
  type = map(object({
    name    = string
    comment = optional(string)
    size    = string
    type    = optional(string)

    auto_resume  = optional(bool)
    auto_suspend = optional(number)

    enable_query_acceleration = optional(bool)

    initially_suspended = optional(bool)

    scaling_policy        = optional(string)
    max_cluster_count     = optional(number)
    min_cluster_count     = optional(number)
    max_concurrency_level = optional(number)

    resource_monitor = optional(string)

    statement_queued_timeout_in_seconds = optional(number)
    statement_timeout_in_seconds        = optional(number)
  }))
  default = {}
}

variable "roles" {
  description = "A map of roles to create"
  type = map(object({
    name    = string
    comment = optional(string)
  }))
  default = {}
}
