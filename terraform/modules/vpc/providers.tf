terraform {
  required_version = ">= 1.5.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.59.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Backend   = "Local"
    }
  }
}
