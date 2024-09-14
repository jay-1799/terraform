resource "aws_codebuild_project" "deploy_build" {
  name          = "${var.project_name}-Deploy"
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_LARGE"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    environment_variable {
      name  = "WEBSITE_BUCKET_NAME"
      value = aws_s3_bucket.website_bucket.bucket
    }
  }

  source {
    type     = "CODEPIPELINE"
    buildspec = file("buildspec.yml")
  }
}