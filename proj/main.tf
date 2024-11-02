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
module "iam" {
  source                 = "./modules/iam"
  data_source_bucket_arn = module.data_source_bucket.data_source_bucket_arn
}

module "crawler" {
  source                  = "./modules/crawler"
  data_source_bucket_name = var.data_source_bucket_name
  tableName               = var.tableName
  partitioner             = var.partitioner
  glue_database_name      = var.glue_database_name
  glue_role_arn           = module.iam.glue_role_arn
  glue_role_policy_attach = module.iam.glue_role_policy_attach
}
