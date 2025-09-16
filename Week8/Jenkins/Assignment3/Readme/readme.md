**Assignment: Create a freestyle job to deploy resources on AWS using terraform**

1. Install plugins : Terraform, AWS credentials

![alt text](image.png)

![alt text](image-1.png)

and access key and secret access key in jenkins manage > credetials > global section

![alt text](image-9.png)

2. Apply terraform installation from manage jenkins > tools

![alt text](image-2.png)

3. Add main.tf file to github repo

![alt text](image-3.png)

4. Create a freestyle job with configure:

**SCM as git with github url**

![alt text](image-4.png)

**Use aws secret credentials**

![alt text](image-5.png)

**Select terraform checkbox in environment section**

![alt text](image-6.png)

**Add build steps in build section**

![alt text](image-7.png)


![alt text](image-10.png)

5. See the output on aws console

![alt text](image-8.png)