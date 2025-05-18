**Assignment: Create an Azure Container Registry (ACR) and a Custom IAM Role that provides access to manage ACRs in a Resource Group.**

1. Azure container registry

Step 1: Go toazure portal and search for container registry in search bar.

Step 2: Click on create button and add basic details like subscription, resource group, registry name, location etc.

![alt text](image.png)

Step 3: Click on review and create.

![alt text](image-1.png)

Step 4: From local push the image to azure containaer registry.

![alt text](image-2.png)

![alt text](image-3.png)

![alt text](image-4.png)


2. Custom IAM role :  Give users ability to manage ACRs within a specific resource group only

Step 1: Go to subscription and select your subscription.

![alt text](image-5.png)

Step 2: Select Access control (IAM) from left side bar menu and click on add custom role.

![alt text](image-6.png)

Step 3: Create custom role and add resource group in assignable scopes.

![alt text](image-8.png)

![alt text](image-7.png)

Step 4: Go to resource group created and click on Access control (IAM).

Step 5: Click on add role assignment and select the role created : ACR Manager.

Step 6: Add member to the role and assign to the resource group.

![alt text](image-9.png)