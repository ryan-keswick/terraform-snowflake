locals {
  create_database = var.create_database
}

module "database" {
  for_each = local.create_database ? var.databases : {}

  source = "./modules/database"

  name                        = var.enforce_style ? upper("${var.env}_${each.value.name}_DB") : each.value.name
  comment                     = each.value.comment
  data_retention_time_in_days = each.value.data_retention_time_in_days
}
