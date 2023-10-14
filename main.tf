# This is my first commit
# This is my second commit
#This is my third test


# resource "random_string" "bucket_name" {
#   length           = 16
#   upper            = false
#   special          = false
# }

# resource "aws_s3_bucket" "website_bucket" {

#   #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
#   bucket = var.s3_bucket_name
#   tags = {
#             UserUuid = var.user_uuid
#   }

# }


terraform {
  cloud {
    organization = "ExamProSerah"
    workspaces {
      name = "terraform-cloud"
    }
  }
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  s3_bucket_name = var.s3_bucket_name
  content_version = var.content_version
  
}

# module "terrahouse_aws" {
#   source = "./modules/terrahouse_aws"
#   user_uuid = var.user_uuid
#   s3_bucket_name = var.s3_bucket_name
#   index_html_filepath = var.index_html_filepath
#   error_html_filepath = var.error_html_filepath
#   content_version = var.content_version
#   assets_path = var.assets_path
# }