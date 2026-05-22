terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }

  required_version = ">= 1.0"

  backend "s3" {
    bucket       = "threat-composer-terraform-state-646322278086"
    key          = "threat-composer/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.region
}