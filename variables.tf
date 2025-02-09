variable "region" {
  description = "The AWS region to deploy the VPC"
  type        = string
  default     = "us-east-1"
}
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "subnet_cidrs" {
  description = "A list of CIDR blocks for the subnets"
  type        = list(string)
  validation {
    condition     = length(var.subnet_cidrs) > 0
    error_message = "You must provide at least one subnet CIDR block"
  }
}

variable "azs" {
  description = "A list of availability zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "A list indicating if the subnets are public (true) or private (false)"
  type        = list(bool)
}
