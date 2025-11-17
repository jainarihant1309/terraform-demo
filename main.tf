terraform {
  backend "s3" {
    bucket         = "terraform-state-arihant"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "lock-table"
    encrypt        = true
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
