**Assignment: Deploy a static web application on EC2 instance using modularized Terraform code. The backend should be configured in S3**

Here is the modularized structure:

![alt text](image.png)

Before backend.tf file created 

Run the following commands:

# terraform init

# terraform plan

![alt text](image-1.png)

# terraform apply

So s3 bucket is created:

![alt text](image-2.png)

EC2 instance is created

![alt text](image-3.png)

Now create backend.tf file and run the command:

# terraform init

![alt text](image-4.png)

state file is added to s3 bucket

![alt text](image-5.png)