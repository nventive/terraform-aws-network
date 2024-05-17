variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR Block for the VPC."
}

variable "subnets_ipv4_cidr_block" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "IPv4 CIDR Block for the subnets."
}

variable "subnets_availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "Availability zones for the subnets."
}

variable "subnets_nat_gateway_enabled" {
  type        = bool
  default     = false
  description = "Set to `true` to create a nat gateway in each subnet."
}

variable "subnets_max_nats" {
  type        = number
  default     = 999
  description = "Upper limit on number of NAT Gateways/Instances to create. Set to 1 or 2 for cost savings at the expense of availability."
}

variable "s3_endpoint_enabled" {
  type        = bool
  default     = false
  description = "Set to `true` to create a VPC gateway endpoint for S3."
}

