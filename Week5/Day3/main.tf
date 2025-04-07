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

# Security group to ssh to ec2 instance
resource "aws_security_group" "tf-demo-sg" {
  name        = "tf-demo-sg"
  description = "Security group allowing ssh from anywhere"
  vpc_id      = aws_vpc.tf-demo-vpc.id
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0", ]
    description      = "Inbound traffic from internet to ssh."
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]
  egress = [{
    cidr_blocks      = ["0.0.0.0/0", ]
    description      = "Outbound traffic to internet."
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]
}

# EC2 instance
resource "aws_instance" "tf-demo-ec2-instance" {
  ami                         = "ami-0e35ddab05955cf57"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.tf-demo-sg.id]
  key_name                    = "my-key"
  subnet_id                   = aws_subnet.tf-demo-public-subnet.id
  tags = {
    Name = "demo-tf-instance"
  }
}

# Key pair
resource "aws_key_pair" "tf-demo-key-pair" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDF1Rpfc0xy3omzGteqeA4UJEcNlyXsQzTOWVkUjizTW2LuFqluemw8YArUZQ82poKbRZ5v4RHG1O+VbZ55eTXPjHBRCNm9bJ4T3FxT00gNUiivZxYTiG0zezzfBAV8H5xd/OqlyM1wy1vgX2K20sOPuSo8+RojtZmlusiNVulgATak9xmu4kBeqCtk3NSQpf/fH8Jyj6lkEgHvnX3lQ1WvkxVdZuEiWFnq/+wgEuQYjLXHCTOemUIxZ4zchFMfsfifwAcgjochmri1NyVoSS40osVc1fGyf/HONwb2j5ZQvgcbPoWBTn5YzgEyiy9c7eU1DVjfhffWhkauE9PbIOL1cgEWraDLahD01e7fhzCMpNsQyLKD/ft7XQmiWGNtoPfpSRFj1Scoka9d6b8uwGvqVFTGI2Z32zssnEq1T8vlm7nDIJ+sROo+uvsUDcvjFSGCDlFzBO7tcz5kUt7wI5OBQhTDTeX53D445kRwzWj0UTjyuwpxiT3Jd/jnw2TFImm+T6NpMoFGyCj/vYkA+3QrB6VnY6UCI2BrTR6PK7OJObIurRYI2uBlNVmiyq2U60chrfC8OUO1/AEFSe9EuVxSjhU8nD4H7lldncBG67lChGgBfbUftPnPb/5duZVupo+ECnvHhV/yy+OmbDY+pEVrHyxdR2wV2p/mfjxOLqL9Yw== INTIMETEC+preet.mundra@ITT-PREET-M"
}
