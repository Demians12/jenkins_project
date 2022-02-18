variable  "region" {
    description = "AWS region"
    type = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
}

variable "aws_profile" {
  description = "bloco para VPC"
  default = "default"
  type = string
}

variable "vpc_name" {
  description = "nome da vpc"
}

variable "Author" {
  description = "name of the owner"
  default = "None"
  type = string
}

variable "availability_zones" {
  type = list
}

variable "public_subnets_count" {
  type = number
}

variable "private_subnets_count" {
  type = number
}

