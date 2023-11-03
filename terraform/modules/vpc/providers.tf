terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9.0"
    }
  }
  required_version = ">= 1.5.5"
}

provider "aws" {
  region = var.region
}
