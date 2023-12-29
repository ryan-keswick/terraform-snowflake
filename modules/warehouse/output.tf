output "name" {
  description = "The name of the warehouses"
  value       = snowflake_warehouse.this[0].name
}

output "id" {
  description = "The id of the warehouses"
  value       = snowflake_warehouse.this[0].id
}

