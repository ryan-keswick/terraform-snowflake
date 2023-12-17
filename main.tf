locals {
  create_database  = var.create_database
  create_warehouse = var.create_warehouse

  # I've noticed that the Snowflake provider sometimes errors on size changes
  # a retry seems to fix it
  wh_short_str = {
    XSMALL   = "XS"
    SMALL    = "S"
    MEDIUM   = "M"
    LARGE    = "L"
    XLARGE   = "XL"
    XXLARGE  = "2XL"
    XXXLARGE = "3XL"
    X4LARGE  = "4XL"
    X5LARGE  = "5XL"
    X6LARGE  = "6XL"
  }
}

module "database" {
  for_each = local.create_database ? var.databases : {}

  source = "./modules/database"

  name                        = var.enforce_style ? upper("${var.env}_${each.value.name}_DB") : each.value.name
  comment                     = each.value.comment
  data_retention_time_in_days = each.value.data_retention_time_in_days
}

module "warehouse" {
  for_each = local.create_warehouse ? var.warehouses : {}

  source = "./modules/warehouse"

  name    = var.enforce_style ? upper("${var.env}_${each.value.name}_WH_${local.wh_short_str[each.value.size]}") : each.value.name
  comment = each.value.comment

  size = each.value.size
  type = each.value.type

  auto_resume  = each.value.auto_resume
  auto_suspend = each.value.auto_suspend

  enable_query_acceleration = each.value.enable_query_acceleration

  initially_suspended = each.value.initially_suspended

  scaling_policy        = each.value.scaling_policy
  max_cluster_count     = each.value.max_cluster_count
  min_cluster_count     = each.value.min_cluster_count
  max_concurrency_level = each.value.max_concurrency_level

  resource_monitor = each.value.resource_monitor

  statement_queued_timeout_in_seconds = each.value.statement_queued_timeout_in_seconds
  statement_timeout_in_seconds        = each.value.statement_timeout_in_seconds
}

module "roles" {
  for_each = var.roles

  source = "./modules/role"

  name    = var.enforce_style ? upper("${var.env}_${each.value.name}_ROLE") : each.value.name
  comment = each.value.comment
}
