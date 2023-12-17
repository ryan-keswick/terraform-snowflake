locals {
  create_warehouse = var.create_warehouse
}

resource "snowflake_warehouse" "this" {
  count = local.create_warehouse ? 1 : 0

  name    = var.name
  comment = var.comment

  warehouse_size = var.size
  warehouse_type = var.type

  auto_resume  = var.auto_resume
  auto_suspend = var.auto_suspend

  enable_query_acceleration = var.enable_query_acceleration

  initially_suspended = var.initially_suspended

  scaling_policy        = var.scaling_policy
  max_cluster_count     = var.max_cluster_count
  min_cluster_count     = var.min_cluster_count
  max_concurrency_level = var.max_concurrency_level

  resource_monitor = var.resource_monitor

  statement_queued_timeout_in_seconds = var.statement_queued_timeout_in_seconds
  statement_timeout_in_seconds        = var.statement_timeout_in_seconds
}
