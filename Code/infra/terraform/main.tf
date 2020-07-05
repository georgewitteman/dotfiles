terraform {
  backend "s3" {
    bucket         = "georgewitteman-terraform-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "terraform-locks"
  }
}
