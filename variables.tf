variable "user_uuid" {
  description = "The UUID of the user."
  type        = string
  # default     = "default-uuid" # You can set a default value if needed
  
  validation {
    condition = can(regex("^[a-f0-9]{8}-[a-f0-9]{4}-[4][a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}$", var.user_uuid))
    error_message = "Invalid UUID format. Must be in the format 'xxxxxxxx-xxxx-4xxx-9xxx-xxxxxxxxxxxx'."
  }
}
