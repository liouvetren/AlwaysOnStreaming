output "iam_user" {
	value = "${data.aws_canonical_user_id.current.display_name}"
}

output "aws_zones" {
  	value = "${data.aws_availability_zones.all.names}"
}

output "k8s_domain"{
	value = "${aws_route53_zone.k8s.name}"
}

output "k8s_zone_id" {
  	value = "${aws_route53_zone.k8s.zone_id}"
}

output "k8s_state"{
	value = "${aws_s3_bucket.k8s.id}"
}