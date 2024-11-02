output "glue_database_arn" {
  value = aws_glue_catalog_database.csv_database.arn
}

output "glue_database_name" {
  value = aws_glue_catalog_database.csv_database.name
}
