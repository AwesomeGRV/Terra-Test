locals {
  source_vpc_name        = "${var.vpc_name}-${var.namespace}-vpc"
  source_subnet_name     = "${var.vpc_name}-${var.namespace}-public-sbunet"
  source_igw_name        = "${var.vpc_name}-${var.namespace}-igw"
  source_rt              = "${var.vpc_name}-${var.namespace}-rt"
}

resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr}"
  enable_dns_support = "true" 
  enable_dns_hostnames = "true" 
  enable_classiclink = "false"
  instance_tenancy = "default"    
  tags = {
      Name = local.source_vpc_name
  }
  provisioner "local-exec" {
  command = "echo ${aws_vpc.vpc.id} > /tmp/vpc_id.txt"
  }

}