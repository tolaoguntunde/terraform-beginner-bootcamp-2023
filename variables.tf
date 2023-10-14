variable "user_uuid" {
  type        = string
}

variable "s3_bucket_name" {
  type        = string
}

# variable "index_html_filepath" {
#   type        = string
  
# }

# variable "error_html_filepath" {
#   type        = string
  
# }

variable "content_version" {
  type        = number
  description = "The content version (positive integer starting at 1)"
}

# variable "assets_path" {
#   description = "Path to asset folder"
#   type = string
# }