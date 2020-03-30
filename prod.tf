provider "aws" {
	profile = "default"
	region	= "us-west-1"
}

resource "aws_s3_bucket" "prod_tf_course" {
	bucket = "tf-course-bable"
	acl = "private"
}

resource "aws_default_vpc" "default" {

}