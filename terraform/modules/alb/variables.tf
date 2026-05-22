variable "app_name" {
  description = "Application name used for resource naming"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_1_id" {
  description = "ID of public subnet 1"
  type        = string
}

variable "public_subnet_2_id" {
  description = "ID of public subnet 2"
  type        = string
}

variable "alb_security_group_id" {
  description = "ID of the ALB security group"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
}