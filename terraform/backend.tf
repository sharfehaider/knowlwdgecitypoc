terraform {
  backend "s3" {
    bucket         = "knowledgecity"  
    key            = "terraform/state/default.tfstate"
    region         = "us-east-1" 
    dynamodb_table = "terraform-locks" 
    encrypt        = true ß
  }
}
