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
  region = "ap-south-1"  
}

terraform {
  backend "s3" {
    bucket = "terraform-earth-statefile"
    key    = "terraform/terraform.tfstate"
    region = "ap-south-1"
  }
}
