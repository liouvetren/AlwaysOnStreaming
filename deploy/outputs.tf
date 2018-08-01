output "vpc_id" {
  	value = "${module.secure_vpc.vpc_id}"
}

output "public_zone_id" {
  	value = "${aws_route53_zone.public.zone_id}"
}

output "k8s_state_store" {
  	value = "s3://${aws_s3_bucket.k8s_state.id}"
}

output "aws_zones" {
  	value = "${data.aws_availability_zones.all.names}"
}

output "domain_name" {
  	value = "${var.domain_name}"
}
