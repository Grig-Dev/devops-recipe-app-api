terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }

  backend "s3" {
    bucket         = "devops-recipe-app-tf-state-grigor"
    key            = "tf-state-setup"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "devops-recipe-app-api-tf-lock-new"
  }
}

provider "aws" {
  region = "eu-west-3"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}
