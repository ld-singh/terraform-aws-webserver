# Set up remote backend for stage and required providers
terraform {
  backend "s3" {
    bucket  = "terraform-state-bucket-ls-demo"
    key     = "terraform-ec2-webserver/terraform.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

