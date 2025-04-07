variable "tf-demo-s3-bucket" {
  default     = "tf-demo-s3-bucket-preet"
  type        = string
  description = "S3 bucket used for storing state file in remote backend."
}
