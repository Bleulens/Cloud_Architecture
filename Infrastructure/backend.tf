# Where to store Terraform state
terraform {
  backend "s3" {
    bucket         = "martin-tf-state-storage-us-east-1"
    key            = "state.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
