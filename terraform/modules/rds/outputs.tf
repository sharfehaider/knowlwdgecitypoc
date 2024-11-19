output "rds_endpoint" {
  description = "RDS Cluster Endpoint"
  value       = aws_rds_cluster.main.endpoint
}

output "rds_reader_endpoint" {
  description = "RDS Reader Endpoint"
  value       = aws_rds_cluster.main.reader_endpoint
}

output "rds_cluster_id" {
  description = "RDS Cluster Identifier"
  value       = aws_rds_cluster.main.id
}
