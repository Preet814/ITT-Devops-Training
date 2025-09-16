**Assignment: Configure the remote backend in S3 to store the state file for your terraform module**

Create S3 bucket only(No backend.tf file) using terraform:

Run the following commands:

# terraform init

![alt text](image-2.png)

# terraform plan

![alt text](image-3.png)

# terraform apply

![alt text](image-4.png)



Now S3 bucket is created:

![alt text](image.png)


Now write backend.tf file to initialze the backend

![alt text](image-5.png)

On AWS console go to S3 bucket and check:

![alt text](image-1.png)