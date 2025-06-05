output "route_table_id" {
  value = aws_route_table.main.id
}

output "routes" {
  value = aws_route_table.main.route
}
