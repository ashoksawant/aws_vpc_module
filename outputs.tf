output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.subnet[*].id
}

output "public_route_table_ids" {
  value = aws_route_table.public[*].id
}
