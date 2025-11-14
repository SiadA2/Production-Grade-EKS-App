locals {
  name   = "project-vpc"
  domain = "lab.nginxsiad.com"
  region = "eu-west-2"

  tags = {
    Environment = "prod"
    Project     = "EKS"
    Owner       = "Siad"
  }
}