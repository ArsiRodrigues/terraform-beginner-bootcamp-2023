terraform {

  #this next block is required to migrate this project state file to Terraform Cloud
 cloud {
    organization = "SigmaSystems"

    workspaces {
      name = "terra-house-1"
    }
  }
  
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

#NOT RECOMMENDED TO HARD CODE AWS CREDENTIALS IN TERRAFORM 
provider "aws" {

}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length = 32
  special = false
  lower = true
  upper = false 
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name"{
  value = random_string.bucket_name.result
}