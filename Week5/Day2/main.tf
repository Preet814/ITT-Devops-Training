# VPC
resource "aws_vpc" "tf-demo-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tf-demo-vpc"
  }
}

# Internet gateway
resource "aws_internet_gateway" "tf-demo-igw" {
  vpc_id = aws_vpc.tf-demo-vpc.id
  tags = {
    Name = "tf-demo-igw"
  }
}

# Public subnet
resource "aws_subnet" "tf-demo-public-subnet" {
  vpc_id                  = aws_vpc.tf-demo-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-demo-public-subnet"
  }
}

# Private subnet
resource "aws_subnet" "tf-demo-private-subnet" {
  vpc_id            = aws_vpc.tf-demo-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "tf-demo-private-subnet"
  }
}

# Public route table
resource "aws_route_table" "tf-demo-public-rt" {
  vpc_id = aws_vpc.tf-demo-vpc.id
  tags = {
    Name = "tf-demo-public-rt"
  }
}

# Public routes (internet gateway)
resource "aws_route" "tf-demo-public-routes" {
  route_table_id         = aws_route_table.tf-demo-public-rt.id
  gateway_id             = aws_internet_gateway.tf-demo-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# public subnet association to public route table
resource "aws_route_table_association" "tf-demo-public-subnet-association" {
  route_table_id = aws_route_table.tf-demo-public-rt.id
  subnet_id      = aws_subnet.tf-demo-public-subnet.id
}

# Private route table
resource "aws_route_table" "tf-demo-private-rt" {
  vpc_id = aws_vpc.tf-demo-vpc.id
  tags = {
    Name = "tf-demo-private-rt"
  }
}

# Private subnet association to private route table
resource "aws_route_table_association" "tf-demo-private-subnet-association" {
  route_table_id = aws_route_table.tf-demo-private-rt.id
  subnet_id      = aws_subnet.tf-demo-private-subnet.id
}
