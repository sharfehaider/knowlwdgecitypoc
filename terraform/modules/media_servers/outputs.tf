output "media_server_ids" {
  description = "IDs of the media server instances"
  value       = aws_instance.media_servers[*].id
}

output "media_server_private_ips" {
  description = "Private IPs of the media server instances"
  value       = aws_instance.media_servers[*].private_ip
}
