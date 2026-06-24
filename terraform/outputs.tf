output "alb_dns_name" {
  value       = aws_lb.main.dns_name
  description = "ALB DNS name - use this to access the app"
}

output "alb_url" {
  value       = "http://${aws_lb.main.dns_name}"
  description = "Full URL of the application"
}
