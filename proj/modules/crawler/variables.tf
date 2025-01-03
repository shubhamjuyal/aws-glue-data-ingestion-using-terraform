variable "data_source_bucket_name" {}
variable "tableName" {}
variable "partitioner" {}
variable "glue_database_name" {}
variable "crawler_role_arn" {
  description = "The ARN of the IAM role to be used by the Glue crawler"
  type        = string
}
