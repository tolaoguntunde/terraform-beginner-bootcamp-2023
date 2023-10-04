variable "user_uuid" {
  description = "The UUID of the user."
  type        = string
  # default     = "default-uuid" # You can set a default value if needed
  
  validation {
    condition = can(regex("^[a-f0-9]{8}-[a-f0-9]{4}-[4][a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}$", var.user_uuid))
    error_message = "Invalid UUID format. Must be in the format 'xxxxxxxx-xxxx-4xxx-9xxx-xxxxxxxxxxxx'."
  }
}

variable "s3_bucket_name" {
  description = "The name of the AWS S3 bucket."
  type        = string

  validation {
    condition     = can(regex("^([a-z0-9.-]+)$", var.s3_bucket_name))
    error_message = "Invalid S3 bucket name. It must be between 3 and 63 characters, contain only lowercase letters, numbers, hyphens, and periods, and start and end with a lowercase letter or number."
  }
}
