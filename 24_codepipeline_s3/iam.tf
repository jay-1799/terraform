resource "aws_iam_role" "pipeline_role" {
  name = "${var.project_name}-pipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "pipeline_policy_combined" {
  name   = "PipelineAccessPolicy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:GetBucketVersioning",
          "s3:GetObjectVersion",
          "s3:PutObjectAcl",
          "s3:PutObjectVersionAcl"
        ],
        Resource = [
          "${aws_s3_bucket.artifact_bucket.arn}",
          "${aws_s3_bucket.artifact_bucket.arn}/*"
        ]
      },
      {
        Effect   = "Allow"
        Action   = [
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:PutObjectVersionAcl"
        ],
        Resource = "arn:aws:s3:::project12-website-bucket/*"
      },
      {
        Effect   = "Allow"
        Action   = [
          "codebuild:BatchGetBuilds",
          "codebuild:StartBuild",
          "codebuild:StopBuild"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = [
          "codestar-connections:UseConnection",
          "codestar-connections:ListConnections",
          "codepipeline:StartPipelineExecution",
          "codepipeline:GetPipeline",
          "codepipeline:GetPipelineExecution",
          "codepipeline:ListPipelineExecutions"
        ],
        Resource = "*"
      }
    ]
  })

  depends_on = [aws_iam_role.pipeline_role]
}

resource "aws_iam_role_policy_attachment" "attach_pipeline_policy" {
  role       = aws_iam_role.pipeline_role.name
  policy_arn = aws_iam_policy.pipeline_policy_combined.arn
}

resource "aws_iam_role" "codebuild_role" {
  name = "${var.project_name}-codebuild-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "combined_codebuild_policy" {
  name        = "CombinedCodeBuildPolicy"
  description = "Policy for CodePipeline and CodeBuild permissions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "codebuild:StartBuild"
        Resource = "arn:aws:codebuild:us-east-1:587899359553:project/project12-Deploy"
      },
      {
        Effect   = "Allow"
        Action   = ["s3:*", "logs:*"],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_combined_codebuild_policy" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.combined_codebuild_policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_pipeline_codebuild_policy" {
  role       = aws_iam_role.pipeline_role.name
  policy_arn = aws_iam_policy.combined_codebuild_policy.arn
}
