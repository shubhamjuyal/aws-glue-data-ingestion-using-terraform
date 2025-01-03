output "crawler_role_arn" {
  value       = aws_iam_role.crawler_role.arn
  description = "The ARN of the IAM role for Glue"
}
