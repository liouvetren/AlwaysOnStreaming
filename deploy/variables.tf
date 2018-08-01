variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

variable "keypair_name" {
	description = "The name of your pre-made key-pair in Amazon (e.g. david-IAM-keypair )" 
} 

variable "fellow_name" {
  description = "The name that will be tagged on your resources."
}

variable "domain_name"{
  description = "domain name"
}

