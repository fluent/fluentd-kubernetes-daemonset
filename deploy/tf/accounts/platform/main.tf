terraform {
  backend "s3" {
    bucket  = "circle-tf-platform"
    key     = "fluentd-kubernetes-daemonset"
    region  = "us-east-1"
    encrypt = "true"
    dynamodb_table = "terraform-state-lock-dynamo-platform"
  }
}

module "codebuild" {
  source = "../../lib/codepipeline"

  region                  = "us-east-1"
  account                 = "platform"
  github_oauth_secret_id  = "arn:aws:secretsmanager:us-east-1:683583236714:secret:/platform/wallets-api-9A1n3h"
  name                    = "fluentd"
  owner                   = "circlefin"
  repo                    = "fluentd-kubernetes-daemonset"
  vpc_id                  = "vpc-030a816f83743eea2"
  vpc_subnets             = ["subnet-0d3722af0dc965461","subnet-03d7c7e9d7f298d3b","subnet-09e979269bb623655","subnet-08b67795bc2e632c2","subnet-06358fadd94685aec","subnet-073233ebae1d0f448"]
}
