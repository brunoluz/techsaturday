# Require TF version to be same as or greater than 0.12.13
terraform {
  backend "s3" {
    bucket         = "github-actions-terraform-teste-2"
    key            = "terraform.tfstate"
    region         = "sa-east-1"
    dynamodb_table = "aws-locks"
    encrypt        = true
  } 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_vpc" "vpc" {
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  tags = {
    Name      = "Vpc"
    Terraform = "true"
  }
}