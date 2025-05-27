data "terraform_remote_state" "backend" {
  backend = "s3"

  config = {
    bucket = "martin-tf-state-storage-us-east-1" # 🔥 Matches your backend.tf
    key    = "state.tfstate"                     # 🔥 Must match the backend key
    region = "us-east-1"                         # 🔥 Same region as backend
  }
}
