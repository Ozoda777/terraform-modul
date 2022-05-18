resource "aws_vpc" "Main" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "Main"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.Main.id
  cidr_block = var.pub_cidr
  tags = {
    "Name" = "${var.tag} Public Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.Main.id
  cidr_block = var.prv_cidr
  tags = {
    "Name" = "${var.tag} Private Subnet"
  }
}
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.Main.id 
  tags = {
      "Name" = "Internet gateway"
  }  
}

resource "aws_route_table" "Route-Table-Pub" {
  vpc_id = aws_vpc.Main.id  
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.internet_gateway.id
  } 
tags = {
    "Name" = "Public route table"
}
}

resource "aws_route_table" "Route-Table-Prv" {
  vpc_id = aws_vpc.Main.id  
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.internet_gateway.id
  } 
tags = {
    "Name" = "Private route table"
}
}

resource "aws_eip" "EIP" {
    vpc = true
     
}
resource "aws_nat_gateway" "Nat-gateway" {
    allocation_id = aws_eip.EIP.id
    subnet_id = aws_subnet.public_subnet.id
    tags = {
      "Name" = "Nat-gateway"
    }
}
