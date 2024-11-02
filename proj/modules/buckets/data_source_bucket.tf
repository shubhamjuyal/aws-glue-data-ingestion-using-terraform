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

# resource "aws_s3_bucket_public_access_block" "csv_data_bucket" {
#   bucket = aws_s3_bucket.data_source_bucket.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }
