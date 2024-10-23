module "data_source_bucket" {
  source                  = "./modules/buckets"
  data_source_bucket_name = var.data_source_bucket_name
  tableName               = var.tableName
  partitioner             = var.partitioner
  csv_file_path           = var.csv_file_path
  csv_name                = var.csv_name
}
