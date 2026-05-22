resource "aws_acm_certificate" "main" {
  domain_name       = var.app_subdomain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.app_subdomain
  }
}