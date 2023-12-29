locals {
  create_database = var.create_database
}

resource "snowflake_database" "this" {
  count = local.create_database ? 1 : 0

  name    = var.name
  comment = var.comment

  data_retention_time_in_days = var.data_retention_time_in_days
  is_transient                = var.is_transient
}
