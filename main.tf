terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_s3_bucket" "a" {
    bucket = "mk-tf-test-bucket"

    tags = {
        name        = "My Bucket"
        Environment = "Dev"
    }
}

resource "aws_s3_bucket_acl" "settings" {
    bucket = aws_s3_bucket.a.id
    acl    = "private"
}