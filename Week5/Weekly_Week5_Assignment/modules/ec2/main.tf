resource "aws_security_group" "tf-demo-security-group" {
  name = "demo-sg-tf-1"
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
    },
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = "Host website on http port"
      from_port        = 80
      to_port          = 80
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


resource "aws_instance" "tf-demo-ec2-instance" {
  ami                         = var.ami
  instance_type               = var.instance-type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.tf-demo-security-group.id]
  key_name                    = "my-key"
  user_data                   = <<EOF
#!/bin/bash
yes | sudo apt update
yes | sudo apt install apache2
echo "<h1>Server Details</h1><p><strong>Hostname:</strong> $(hostname)</p><p><strong>IP Address:</strong> $(hostname -I | cut -d' ' -f1)</p>" > /var/www/html/index.html
sudo systemctl restart apache2
  EOF
  tags = {
    Name = "tf-demo-instance"
  }

}

resource "aws_key_pair" "tf-demo-key-pair" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDF1Rpfc0xy3omzGteqeA4UJEcNlyXsQzTOWVkUjizTW2LuFqluemw8YArUZQ82poKbRZ5v4RHG1O+VbZ55eTXPjHBRCNm9bJ4T3FxT00gNUiivZxYTiG0zezzfBAV8H5xd/OqlyM1wy1vgX2K20sOPuSo8+RojtZmlusiNVulgATak9xmu4kBeqCtk3NSQpf/fH8Jyj6lkEgHvnX3lQ1WvkxVdZuEiWFnq/+wgEuQYjLXHCTOemUIxZ4zchFMfsfifwAcgjochmri1NyVoSS40osVc1fGyf/HONwb2j5ZQvgcbPoWBTn5YzgEyiy9c7eU1DVjfhffWhkauE9PbIOL1cgEWraDLahD01e7fhzCMpNsQyLKD/ft7XQmiWGNtoPfpSRFj1Scoka9d6b8uwGvqVFTGI2Z32zssnEq1T8vlm7nDIJ+sROo+uvsUDcvjFSGCDlFzBO7tcz5kUt7wI5OBQhTDTeX53D445kRwzWj0UTjyuwpxiT3Jd/jnw2TFImm+T6NpMoFGyCj/vYkA+3QrB6VnY6UCI2BrTR6PK7OJObIurRYI2uBlNVmiyq2U60chrfC8OUO1/AEFSe9EuVxSjhU8nD4H7lldncBG67lChGgBfbUftPnPb/5duZVupo+ECnvHhV/yy+OmbDY+pEVrHyxdR2wV2p/mfjxOLqL9Yw== INTIMETEC+preet.mundra@ITT-PREET-M"
}
