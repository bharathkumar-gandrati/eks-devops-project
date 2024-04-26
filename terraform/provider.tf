terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.45.0"
    }
  }
}

# Provider and the region
provider "aws" {
  region = "ap-south-1"  # Oregon region
  profile = "Bharath_Kumar"
  #access_key = [Bharath_Kumar]
  #secret_key = [Bharath_Kumar]
}



terraform {
  backend "s3" {
    bucket = "terraform-valaxy-statefile"
    key    = "terraform/terraform.tfstate"
    region = "us-west-2"
    profile = "Bharath_Kumar"
    #access_key = [Bharath_Kumar]
    #secret_key = [Bharath_Kumar]
  }
}
