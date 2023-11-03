![nventive](https://nventive-public-assets.s3.amazonaws.com/nventive_logo_github.svg?v=2)

# terraform-aws-network

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=flat-square)](LICENSE) [![Latest Release](https://img.shields.io/github/release/nventive/terraform-aws-network.svg?style=flat-square)](https://github.com/nventive/terraform-aws-network/releases/latest)

Terraform module to create a VPC with public and private subnets.

---

## Examples

**IMPORTANT:** We do not pin modules to versions in our examples because of the difficulty of keeping the versions in
the documentation in sync with the latest released versions. We highly recommend that in your code you pin the version
to the exact version you are using so that your infrastructure remains stable, and update versions in a systematic way
so that they do not catch you by surprise.

```hcl
module "network" {
  source = "nventive/network/aws"
  # We recommend pinning every module to a specific version
  # version = "x.x.x"

  namespace = "eg"
  stage     = "test"
  name      = "app"

  vpc_cidr_block              = "10.0.0.0/16"
  subnets_ipv4_cidr_block     = ["10.0.0.0/16"]
  subnets_availability_zones  = ["us-east-1a", "us-east-1b"]
  subnets_nat_gateway_enabled = true
  s3_endpoint_enabled         = true
}
```
