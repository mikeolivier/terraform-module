# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "babilone-bucket-1"
    key       = "ngnitdigital-ecs.tfstate"
    region    = "us-east-1"
    profile   = "Mj-user1"
  }
}