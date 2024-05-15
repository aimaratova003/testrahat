provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 
 tags = {
   Name = "Project VPC"
 }
}
resource "aws_subnet" "public_subnets" {
  count                  = 3
  vpc_id                 = aws_vpc.main.id
  cidr_block             = "10.0.${count.index}.0/24"
 
}

resource "aws_subnet" "private" {
  count                  = 3
