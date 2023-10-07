variable "user_uuid" {
  description = "The UUID of the user."
  type        = string
  # default = "82ea8b84-b959-4500-8622-4fa974959cff"
  
  # default     = "default-uuid" # You can set a default value if needed
  
  # validation {
  #   condition = can(regex("^[a-f0-9]{8}-[a-f0-9]{4}-[4][a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}$", var.user_uuid))
  #   error_message = "Invalid UUID format. Must be in the format 'xxxxxxxx-xxxx-4xxx-9xxx-xxxxxxxxxxxx'."
  # }
}

variable "s3_bucket_name" {
  description = "The name of the AWS S3 bucket."
  type        = string
  # default = "serahstatic"
  # validation {
  #   condition     = can(regex("^([a-z0-9.-]+)$", var.s3_bucket_name))
  #   error_message = "Invalid S3 bucket name. It must be between 3 and 63 characters, contain only lowercase letters, numbers, hyphens, and periods, and start and end with a lowercase letter or number."
  # }
}

variable "index_html_filepath" {
  type        = string
  description = "The file path to the index.html file"
  # default     = "path/to/your/index.html"
  validation {
    condition     = can(file(var.index_html_filepath))
    error_message = "The specified index.html file path does not exist."
  }
}

variable "error_html_filepath" {
  type        = string
  description = "The file path to the index.html file"
  # default     = "path/to/your/index.html"
  validation {
    condition     = can(file(var.error_html_filepath))
    error_message = "The specified index.html file path does not exist."
  }
}

variable "content_version" {
  type        = number
  description = "The content version (positive integer starting at 1)"
  # default     = 1

  validation {
    condition     = var.content_version > 0 && ceil(var.content_version) == floor(var.content_version)
    error_message = "Content version must be a positive integer starting at 1."
  }
}
