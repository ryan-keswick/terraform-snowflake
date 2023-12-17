variable "name" {
  description = "The name of the database"
  type        = string
}

variable "comment" {
  description = "The comment of the database"
  type        = string
  default     = null
}
