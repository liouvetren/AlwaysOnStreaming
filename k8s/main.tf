provider "aws" {
	region  = "${var.aws_region}"
  version = "~> 1.29"
}

data "aws_availability_zones" "all" {}
data "aws_canonical_user_id" "current" {}

data "aws_route53_zone" "primary"{
  name  = "${var.primary_domain}"
}


resource "aws_route53_zone" "k8s" {
  name          = "k8s.${var.primary_domain}"
  force_destroy = true
}

# add NS to parent domain
resource "aws_route53_record" "k8s"{
  zone_id = "${data.aws_route53_zone.primary.zone_id}"
  name    = "${aws_route53_zone.k8s.name}"
  type    = "NS"
  ttl     = "300"
  records = [
    "${aws_route53_zone.k8s.name_servers.0}",
    "${aws_route53_zone.k8s.name_servers.1}",
    "${aws_route53_zone.k8s.name_servers.2}",
    "${aws_route53_zone.k8s.name_servers.3}",
  ]
}

# kops truth config
resource "aws_s3_bucket" "k8s" {
  bucket        = "k8s-state-bucket-${data.aws_canonical_user_id.current.display_name}"
  acl           = "private"
  force_destroy = true
  versioning {
    enabled = true
  }
}


