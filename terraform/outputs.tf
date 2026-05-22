output "acm_domain_validation_options" {
  description = "ACM domain validation options"
  value       = module.acm.domain_validation_options
}

output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = module.alb.alb_dns_name
}