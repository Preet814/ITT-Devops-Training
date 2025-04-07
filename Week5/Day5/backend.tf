terraform {
  backend "s3" {
    bucket = "tf-demo-s3-bucket-1"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
