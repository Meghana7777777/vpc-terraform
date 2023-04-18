terraform {
  backend "s3" {
    key            = "infrastructure/practice/vpc/terraform.tfstate"
    region         = "us-east-1"
    bucket         = "meghana-us-east-1-tfstates"
    encrypt        = true
  }
}
