resource "aws_instance" "tf-demo-example" {
  ami           = "ami-00bb6a80f01f03502"
  instance_type = "t2.micro"
  tags = {
    Name = "demo1"
  }
}
