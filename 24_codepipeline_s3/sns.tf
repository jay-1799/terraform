resource "aws_sns_topic" "sns_repo_trigger" {
  name = var.project_name
} 