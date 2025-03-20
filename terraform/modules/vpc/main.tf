locals {
  iam_policy = "AWSDoEverythingAllowed"
}

terraform {
  required_version = ">= 1.0"
}

resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-insecure-bucket"

  acl = "public-read" # tfsec will flag this as a security risk

  tags = {
    Name        = "InsecureBucket"
    Environment = "Dev"
  }
}
