variable "name" {
  description = "The name of the database"
  type        = string
}

variable "comment" {
  description = "The comment of the database"
  type        = string
  default     = null
}

variable "data_retention_time_in_days" {
  description = "The data retention time in days of the database"
  type        = number
  default     = 0
}

variable "is_transient" {
  description = "Whether the database is transient"
  type        = bool
  default     = null
}
