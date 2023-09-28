# This is my first commit
# This is my second commit
#This is my third test
terraform {
  cloud {
    organization = "serah-terraform"

    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 16
  upper            = false
  special          = false
}

resource "aws_s3_bucket" "example" {

  #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
  bucket = random_string.bucket_name.result


}


output "random_bucket_name" {
    value = random_string.bucket_name.result
}