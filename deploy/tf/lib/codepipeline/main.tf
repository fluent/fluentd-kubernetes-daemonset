
terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  version = ">= 2.11"
  region  = var.region
}

data "aws_secretsmanager_secret_version" "github-oauth-secret" {
  secret_id = var.github_oauth_secret_id
}

resource "aws_iam_role" "codepipeline_role" {
  name = "${terraform.workspace}-${var.name}-codepipeline-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "${terraform.workspace}-${var.name}-codepipline-policy"
  role = aws_iam_role.codepipeline_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket.codepipeline_bucket.arn}",
        "${aws_s3_bucket.codepipeline_bucket.arn}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    },
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload"
      ]
    },
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "ec2:CreateNetworkInterface",
        "ec2:CreateNetworkInterfacePermission",
        "ec2:DescribeDhcpOptions",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface",
        "ec2:DescribeSubnets",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeVpcs"
      ]
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "${terraform.workspace}-${var.name}-codepipeline-bucket"
  acl    = "private"
}

resource "aws_security_group" "codepipeline_sg" {
  name        = "${terraform.workspace}-${var.name}-build-sg"
  description = "Allow egress to everywhere"
  vpc_id      = var.vpc_id

  # Allow egress to everywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# The build stage is responsible for building and tagging all the images to be deployed.
# aws_codebuild_project.build.source.buildspec defines the path to the buildspec for this stage.
# The input source must have a buildspec at that location.
resource "aws_codebuild_project" "build" {
  name          = "${terraform.workspace}-${var.name}-build"
  description   = "Build stage for ${terraform.workspace}-${var.name}"
  service_role  = "${aws_iam_role.codepipeline_role.id}"

  artifacts {
    type                = "CODEPIPELINE"
    name                = "build_output"
  }

  cache {
    type     = "S3"
    location = "${aws_s3_bucket.codepipeline_bucket.bucket}"
  }

  environment {
    compute_type                = var.instance_size
    image                       = "aws/codebuild/standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
  }

  logs_config {
    cloudwatch_logs {
      group_name = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status = "ENABLED"
      location = "${aws_s3_bucket.codepipeline_bucket.bucket}/build-log"
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "deploy/aws/buildspec_build.yml"
  }

  # We need to specify the VPC configuration to allow hitting Artifactory
  vpc_config {
    vpc_id             = var.vpc_id
    subnets            = var.vpc_subnets
    security_group_ids = [
      aws_security_group.codepipeline_sg.id
    ]
  }
}

resource "aws_codepipeline" "codepipeline" {
  name     = "CI-${var.name}"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = "${aws_s3_bucket.codepipeline_bucket.bucket}"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner       = var.owner
        Repo        = var.repo
        Branch      = var.branch
        OAuthToken  = jsondecode(data.aws_secretsmanager_secret_version.github-oauth-secret.secret_string)["GITHUB_ACCESS_TOKEN"]
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.build.name
      }
    }
  }
}
