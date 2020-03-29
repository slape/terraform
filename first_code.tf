provider "aws" {
  profile   = "default"
  region    = "us-weast-1"
}

resource "aws_s3_bucket" "tf_bucket" {
  bucket    = "tf-course-bable"
  acl       = "private"
}