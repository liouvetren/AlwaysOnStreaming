provider "aws" {
	region  = "${var.aws_region}"
  version = "~> 1.29"
}

data "aws_availability_zones" "all" {}

module "secure_vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name = "${var.fellow_name}-vpc"

  cidr             = "10.0.0.0/24"
  azs              = ["${data.aws_availability_zones.all.names}"]
  public_subnets   = ["10.0.0.0/25"]
  private_subnets  = ["10.0.0.128/25"]

  enable_s3_endpoint   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Owner              = "${var.fellow_name}"
    Terraform          = "yes"
  }
}

module "open_all_sg" {
  source  = "terraform-aws-modules/security-group/aws"

  name        = "open-to-all-sg"
  description = "Security group to make all ports publicly open...not secure at all"
  
  vpc_id                   = "${module.secure_vpc.vpc_id}"
  ingress_cidr_blocks      = ["10.0.0.0/24"]
  ingress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_cidr_blocks      = ["10.0.0.0/24"]
  egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Owner              = "${var.fellow_name}"
    Terraform          = "yes"
  }
}


# for testing instances
resource "aws_instance" "test" {
  ami             = "ami-a9d09ed1"
  instance_type   = "t2.micro"
  key_name        = "${var.keypair_name}"
  count           = 1

  vpc_security_group_ids      = ["${module.open_all_sg.this_security_group_id}"]
  subnet_id                   = "${module.secure_vpc.public_subnets[0]}"
  associate_public_ip_address = true
    
  root_block_device {
      volume_size = 100
      volume_type = "standard"
  }

  tags {
    Name        = "test-${count.index}"
    Owner       = "${var.fellow_name}"
    Terraform   = "yes"
  }

}

# kops pre-requisites
resource "aws_route53_zone" "public" {
  name          = "${var.domain_name}"
}

resource "aws_s3_bucket" "k8s_state" {
  bucket        = "k8s-state-bucket"
  acl           = "private"
  force_destroy = true
  versioning {
    enabled = true
  }
}


