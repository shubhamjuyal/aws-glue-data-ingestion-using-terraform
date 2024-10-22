variable "data_source_bucket_name" {}
variable "tableName" {}
variable "partitioner" {}

resource "aws_s3_bucket" "data_source_bucket" {
  bucket = var.data_source_bucket_name
}

resource "aws_s3_object" "input_folder" {
  bucket = aws_s3_bucket.data_source_bucket.id
  key    = "/input/${var.tableName}/${var.partitioner}/"
}

resource "aws_s3_object" "temp_folder" {
  bucket = aws_s3_bucket.data_source_bucket.id
  key    = "/temp/"
}
resource "aws_s3_object" "scripts_folder" {
  bucket = aws_s3_bucket.data_source_bucket.id
  key    = "/scripts/"
}
