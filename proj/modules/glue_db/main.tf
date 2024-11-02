resource "aws_glue_catalog_database" "csv_database" {
  name = var.glue_database_name
}
