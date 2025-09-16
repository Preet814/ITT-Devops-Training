terraform {
  backend "s3" {
    bucket = "tf-demo-s3-bucket-preet"
    region = "ap-south-1"
    key    = "state/terraform.tfstate"
  }
}
