# aws_VPC_module
terraform aws VPC  module
Requirements 
$ tree minimal-module/
README.md 
main.tf 
variables.tf 
outputs.tf 
• Accept cidr_block from user to create VPC 
• User can create multiple subnets 
• Get CIDR block for subnet from user 
• Get AZS (availability zone) 
• User can mark a subnet as public (default is private) 
■ if public, create IGW 
■ Associate public subnet with Routing table

# Minimal VPC Module

This module creates a VPC with multiple subnets in AWS. Users can specify the CIDR block for the VPC, the CIDR blocks for the subnets, and whether each subnet is public or private.

## Usage

```hcl
module "vpc" {
  source = "./aws_VPC_module"
  
  region = "us-west-2"
  cidr_block     = "10.0.0.0/16"
  vpc_name       = "my-vpc"
  subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  azs            = ["us-west-2a", "us-west-2b"]
  public_subnets = [true, false]
}
```