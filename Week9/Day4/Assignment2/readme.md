**Assignment: Create an Azure Key Vault and store the following: A certificate, A secret (e.g., a database connection string)**

1. Create Azure key vault:

Step 1: Go to azure portal and cselect key vault service.

![alt text](image.png)

Step 2: Click on create key vault and add basic information.

![alt text](image-1.png)

Step 3: Click on review and create.

![alt text](image-2.png)

2. Add self signed certificate.

Step 1: Select objects > certificate in left side bar menu of key vault.

![alt text](image-3.png)

Step 2: Click on Access control(IAM) and click on role assignment.

Step 3: Add role as key vault administrator and select you as member.

![alt text](image-5.png)

![alt text](image-6.png)

Step 4: Click on generate and import and fill in the detials and choose self signed certificate.

![alt text](image-4.png)

Step 5: Certificat is created.

![alt text](image-7.png)



3. A secret

Step 1: Click on object > secret in left side bar menu.

![alt text](image-8.png)

Step 2: Click on generate import secret.

![alt text](image-9.png)

Step 3: Click on create secret.

![alt text](image-10.png)