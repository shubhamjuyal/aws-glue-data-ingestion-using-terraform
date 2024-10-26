variable "data_source_bucket_name" {}
variable "tableName" {}
variable "partitioner" {}
variable "csv_file_path" {}
variable "csv_name" {}

resource "aws_s3_bucket" "data_source_bucket" {
  bucket = var.data_source_bucket_name
}

resource "aws_s3_object" "input_folder" {
  bucket = aws_s3_bucket.data_source_bucket.id
  key    = "/input/${var.tableName}/${var.partitioner}/"
}

resource "aws_s3_object" "upload_csv" {
  bucket = aws_s3_bucket.data_source_bucket.id
  key    = "input/${var.tableName}/${var.partitioner}/${var.csv_name}.csv"
  source = var.csv_file_path
  etag   = filemd5(var.csv_file_path)
  acl    = "private"
}

resource "aws_s3_object" "temp_folder" {
  bucket = aws_s3_bucket.data_source_bucket.id
  key    = "/temp/"
}
resource "aws_s3_object" "scripts_folder" {
  bucket = aws_s3_bucket.data_source_bucket.id
  key    = "/scripts/"
}
