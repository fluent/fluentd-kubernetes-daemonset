// The region to deploy this in
variable "region" {

}

// The AWS account name (like "platform") the chart will be deployed in
variable "account" {

}

// A generic name (like "wallets-api") to describe what this codepipeline is for
variable "name" {

}

// The arn for the secretsmanager secret which holds the GITHUB_ACCESS_TOKEN
variable "github_oauth_secret_id" {

}

// The repository owner (like "circlefin")
variable "owner" {
  default = "circlefin"
}

// The name of the repository (like "wallets-api")
variable "repo" {

}

// The branch to use.  Defaults to master.
variable "branch" {
  default = "master"
}

// The instance size to use for builds.  Defaults to large.
variable "instance_size" {
  default = "BUILD_GENERAL1_LARGE"
}

// The VPC to place Codebuild jobs in.  Useful values are vpc-4e4ad735 for the dev
// account, or vpc-030a816f83743eea2 for the platform account
variable "vpc_id" {
  type = string
}

// The VPC subnets to place Codebuild jobs in.  Useful values are:
// dev: ["subnet-5eca0414","subnet-e5e5dfb8"]
// platform: ["subnet-0d3722af0dc965461","subnet-03d7c7e9d7f298d3b","subnet-09e979269bb623655","subnet-08b67795bc2e632c2","subnet-06358fadd94685aec","subnet-073233ebae1d0f448"]
variable "vpc_subnets" {
  type = list(string)
}
