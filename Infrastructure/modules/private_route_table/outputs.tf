output "route_table_id" {
  value = aws_route_table.private.id
}

output "routes" {
  value = aws_route_table.private.route
}
