resource "aws_glue_crawler" "csv_crawler" {
  name          = "CSVDataCrawler"
  role          = ""
  database_name = var.glue_database_name
  description   = "Crawler to scan CSV files in S3 and register them in Glue Data Catalog"

  s3_target {
    path = "s3://${var.data_source_bucket_name}/${var.tableName}/${var.partitioner}"
  }

  configuration = jsonencode({
    "Version" : 1.0,
    "CrawlerOutput" : {
      "Partitions" : {
        "AddPartitions" : true
      }
    }
  })

  # schedule = "cron(0 12 * * ? *)"  # Daily at noon UTC

  depends_on = [aws_iam_role_policy_attachment.glue_role_policy_attach]
}
