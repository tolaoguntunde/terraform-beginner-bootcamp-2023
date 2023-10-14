
resource "aws_s3_bucket" "website_bucket" {

  #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
  bucket = var.s3_bucket_name
  tags = {
            UserUuid = var.user_uuid
            Hello = "world"
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



# resource "aws_s3_object" "index_html" {
#   bucket = aws_s3_bucket.website_bucket.bucket
#   key    = "index.html"
#   source       = "${path.root}${var.index_html_filepath}"
#   content_type = "text/html"
#   etag = filemd5("${path.root}${var.index_html_filepath}")
#   lifecycle {
#     replace_triggered_by = [ terraform_data.content_version.output ]
#     ignore_changes = [etag]
#   }
#   # source = "${path.root}/public/index.html"
# }


# resource "aws_s3_object" "error_html" {
#   bucket = aws_s3_bucket.website_bucket.bucket
#   key    = "error.html"
#   source       = "${path.root}${var.error_html_filepath}"
#   content_type = "text/html"
#   etag = filemd5("${path.root}${var.error_html_filepath}")
#   lifecycle {
#     ignore_changes = [etag]
#   }
# }

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.website_bucket.bucket
  policy = jsonencode({
                    
    "Version" = "2012-10-17",
    "Statement" = {
            "Sid" = "AllowCloudFrontServicePrincipalReadOnly",
            "Effect" = "Allow",
            "Principal" = {
                "Service" = "cloudfront.amazonaws.com"
            },
            "Action" = "s3:GetObject",
            "Resource" = "arn:aws:s3:::${aws_s3_bucket.website_bucket.id}/*",
            # "Condition" = {
            #     "StringEquals"= {
                    
            #         "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
            #     }
            # }
        }
    
})
    #policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}


resource "terraform_data" "content_version" {
  input = var.content_version
}

# resource "aws_s3_object" "upload_assets" {
#   for_each = fileset("${path.root}/public/assets","*.{jpeg,png,gif}")
#   bucket = aws_s3_bucket.website_bucket.bucket
#   key    = "assets/${each.key}"
#   source = "${path.root}${var.assets_path}/${each.key}"
#   #content_type = "text/html"
#   etag = filemd5("${path.root}${var.assets_path}/${each.key}")
#   lifecycle {
#     replace_triggered_by = [ terraform_data.content_version.output ]
#     ignore_changes = [etag]
#   }
# }