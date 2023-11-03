output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets."
  value       = module.subnets.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the created private subnets."
  value       = module.subnets.private_subnet_ids
}

output "s3_endpoint_arn" {
  description = "ARN of the S3 endpoint."
  value       = join("", aws_vpc_endpoint.s3.*.arn)
}
