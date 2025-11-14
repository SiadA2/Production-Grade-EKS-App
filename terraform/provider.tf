terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }

    helm = {
        source = "hashicorp/helm"
        version = ">= 2.6"
    }
  }

  backend "s3" {
    bucket       = "eks-state-siad"
    key          = "terraform.tfstate"
    region       = "eu-west-2"
    use_lockfile = true
    encrypt      = true
    # enabled versioning on the console
  }
}

provider "aws" {
  region = "eu-west-2"
}