**Assignment: Import an existing resource from AWS in Terraform state file**

Already existing EC2 instance on AWS cloud:

![alt text](image.png)

AWS credentials are configured using AWS cli:

![alt text](image-1.png)

Run command to initialize the plugins with empty resource block

# terraform init

![alt text](image-2.png)

Copy instance id from AWS cloud and run terraform import command:

# terraform import <resource_type>.<resource_name> <id>

# terraform import aws_instance.tf-demo-example i-0be1f3dca411f4606

![alt text](image-3.png)

We can check the current state using this command, it consist of my EC2 instance state:

# terraform show

![alt text](image-4.png)

Now add arguments of your instance according to provided in AWS cloud

![alt text](image-5.png)

Now if we run plan or apply command it will give "No changes"

![alt text](image-6.png)