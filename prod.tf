provider "aws" {
	profile = "default"
	region	= "us-east-2"
}

resource "aws_s3_bucket" "tf-babble-bucket" {
	bucket = "tf-babble-bucket"
	acl = "private"
}

resource "aws_default_vpc" "default" {
	tags = {
  	Name = "Default VPC"
    }
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