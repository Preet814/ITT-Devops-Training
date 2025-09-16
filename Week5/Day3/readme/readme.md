**Assignment: Create EC2 instance (Windows/Linux) using Terraform inside the previously created VPC & Subnet**

Created an EC2 instance in public subnet created in VPC.

Run the commands:

# terraform init

![alt text](image.png)

# terraform plan

![alt text](image-1.png)

# terraform apply

![alt text](image-2.png)

Now connect to EC2 instance using ssh

# ssh -i <path to private key> ubuntu@<public ip address>

![alt text](image-3.png)