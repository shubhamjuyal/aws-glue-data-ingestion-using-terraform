resource "aws_glue_crawler" "csv_crawler" {
  name          = "CSVDataCrawler"
  role          = var.crawler_role_arn
  database_name = var.glue_database_name
  description   = "Crawler to scan CSV files in S3 and register them in Glue Data Catalog"

  s3_target {
    path = "s3://${var.data_source_bucket_name}/input/${var.tableName}/"
  }

  configuration = jsonencode({
    "Version" : 1.0
    "CrawlerOutput" : {
      "Partitions" : {
        "AddOrUpdateBehavior" : "InheritFromTable"
      }
    }
  })
  # schedule = "cron(0 12 * * ? *)"  # Daily at noon UTC
}
