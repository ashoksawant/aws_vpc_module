provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet" {
  count = length(var.subnet_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = var.public_subnets[count.index]
  tags = {
    Name = "${var.vpc_name}-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "igw" {
  count = length([for public in var.public_subnets : public if public])
  vpc_id = aws_vpc.main.id
  depends_on = [aws_vpc.main]
}

resource "aws_route_table" "public" {
  count = length([for public in var.public_subnets : public if public])
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw[count.index].id
  }
}

resource "aws_route_table_association" "public_association" {
  count = length([for public in var.public_subnets : public if public])
  subnet_id = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.public[count.index].id
}
