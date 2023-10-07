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


resource "aws_s3_bucket" "website_bucket" {

  #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
  bucket = var.s3_bucket_name
  tags = {
            UserUuid = var.user_uuid
  }

}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}



resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source       = var.index_html_filepath
  etag = filemd5(var.index_html_filepath)
  # source = "${path.root}/public/index.html"
}


resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source       = var.error_html_filepath
  etag = filemd5(var.error_html_filepath)
  # source = "${path.root}/public/index.html"
}