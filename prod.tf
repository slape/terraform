provider "aws" {
	profile = "default"
	region	= "us-west-1"
}

resource "aws_s3_bucket" "tf_babble" {
	bucket = "tf-course-babble"
	acl = "private"
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "home-web" {
	name 				= "home-web"
	description = "Allow standard http(s) ports inbound."
	
	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["24.98.49.20/32"]
	}
	ingress {
		from_port   = 443
		to_port     = 443
		protocol    = "tcp"
		cidr_blocks = ["24.98.49.20/32"]
	}
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		"Terraform" : "true"
	}
}