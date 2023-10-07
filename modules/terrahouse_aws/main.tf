terraform {
  required_providers {
   
    aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}
# provider "aws" {
#   # Configuration options
# }

#

data "aws_caller_identity" "current" {}

