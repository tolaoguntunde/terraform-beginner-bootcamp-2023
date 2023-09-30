# This is my first commit
# This is my second commit
#This is my third test


resource "random_string" "bucket_name" {
  length           = 16
  upper            = false
  special          = false
}

resource "aws_s3_bucket" "example" {

  #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
  bucket = random_string.bucket_name.result
  tags = {
  UserUuid = var.userid
  }
}

