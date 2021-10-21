provider "aws" {
    region = "eu-west-1"
    
}


variable "cidr_blocks" {
    description = "cidr blocks for VPC and subnets"
    type = list(string)
}


variable "environment" {
    description = "deployment environment"
}

 
resource "aws_subnet" "dev-subnet-1" {
    vpc_id = data.aws_vpc.existing.id
    cidr_block = var.cidr_blocks[0]
    availability_zone = "eu-west-1a"
     tags = {
         Name: "Nana-course-dev"
     }
}

data "aws_vpc" "existing" {
  default = true
}

resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing.id
    cidr_block = var.cidr_blocks[1]
    availability_zone = "eu-west-1a"
      tags = {
         Name: "Nana-course-dev2"
     }
}

output "dev-subnet-1" {
    value = aws_subnet.dev-subnet-1.id
}

output "dev-subnet-2" {
    value = aws_subnet.dev-subnet-2.id
}

output "existing" {
    value = data.aws_vpc.existing
}