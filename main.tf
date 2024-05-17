locals {
  enabled = module.this.enabled
}

data "aws_region" "current" {}

module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.0.0"

  ipv4_primary_cidr_block = var.vpc_cidr_block

  context = module.this.context
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.1.0"

  vpc_id              = module.vpc.vpc_id
  igw_id              = [module.vpc.igw_id]
  ipv4_cidr_block     = var.subnets_ipv4_cidr_block
  availability_zones  = var.subnets_availability_zones
  nat_gateway_enabled = var.subnets_nat_gateway_enabled
  max_nats            = var.subnets_max_nats

  context = module.this.context
}

module "vpce_s3_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context    = module.this.context
  attributes = ["vpce-s3"]
}

resource "aws_vpc_endpoint" "s3" {
  count = var.s3_endpoint_enabled && local.enabled ? 1 : 0

  vpc_id = module.vpc.vpc_id

  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = module.subnets.private_route_table_ids

  tags = module.vpce_s3_label.tags
}
