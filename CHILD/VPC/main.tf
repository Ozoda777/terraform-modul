resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "${var.tag}-VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.pub_cidr
  tags = {
    "Name" = "${var.tag} Public Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.prv_cidr
  tags = {
    "Name" = "${var.tag} Private Subnet"
  }
}