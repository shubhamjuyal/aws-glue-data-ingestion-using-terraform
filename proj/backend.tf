terraform {
  backend "s3" {
    bucket  = "shubhamjuyal-s3-sample-remote-backend"
    region  = "ap-south-1"
    key     = "terraform.tfstate"
    encrypt = true
    # dynamodb_table = "terraform-lock" #FIXME
  }
}
