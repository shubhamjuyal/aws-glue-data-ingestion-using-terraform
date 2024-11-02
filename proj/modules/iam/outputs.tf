output "glue_role_arn" {
  value       = aws_iam_role.glue_role.arn
  description = "The ARN of the IAM role for Glue"
}

output "glue_role_policy_attach" {
  value = aws_iam_role_policy_attachment.glue_role_policy_attach
}
