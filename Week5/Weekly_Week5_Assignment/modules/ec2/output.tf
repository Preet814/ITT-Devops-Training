output "public-ipv4-address" {
  value = aws_instance.tf-demo-ec2-instance.public_ip
}
