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
