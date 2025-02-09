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