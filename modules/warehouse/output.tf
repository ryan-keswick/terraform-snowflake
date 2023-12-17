output "warehouse_ids" {
  description = "The IDs of the warehouses"
  value       = snowflake_warehouse.this.*.id
}
