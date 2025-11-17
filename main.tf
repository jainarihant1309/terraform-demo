
terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket = "your-tf-state-bucket"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "demo" {
  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"

  tags = {
    Name = "github-actions-demo"
  }
}
