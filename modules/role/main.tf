resource "snowflake_role" "this" {
  name    = var.name
  comment = var.comment
}
