# Threat Composer — Terraform variables
variable "region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-west-2"
}

variable "app_name" {
  description = "Name used across all resources"
  type        = string
  default     = "threat-composer"
}

variable "image_url" {
  description = "ECR image URL for the ECS task"
  type        = string
  default     = "646322278086.dkr.ecr.eu-west-2.amazonaws.com/threat-composer:latest"
}

variable "domain_name" {
  description = "Base domain name"
  type        = string
  default     = "mohamedahmed.uk"
}

variable "app_subdomain" {
  description = "Full domain for the app"
  type        = string
  default     = "tm.mohamedahmed.uk"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 3000
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 1
} # updated
