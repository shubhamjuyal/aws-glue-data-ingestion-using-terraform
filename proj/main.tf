module "data_source_bucket" {
  source                  = "./modules/buckets"
  data_source_bucket_name = var.data_source_bucket_name
  tableName               = var.tableName
  partitioner             = var.partitioner
  csv_file_path           = var.csv_file_path
  csv_name                = var.csv_name
}

module "glue_db" {
  source             = "./modules/glue_db"
  glue_database_name = var.glue_database_name
}

module "crawler" {
  source                  = "./modules/crawler"
  data_source_bucket_name = var.data_source_bucket_name
  tableName               = var.tableName
  partitioner             = var.partitioner
  glue_database_name      = var.glue_database_name
}
