output "glue_role_arn" {
  value       = aws_iam_role.glue_role.arn
  description = "The ARN of the IAM role for Glue"
}
