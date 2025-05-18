**Assignment 1: Create a Resource Group and apply a lock (Read-Only or Delete) using the Azure Portal.**

Step 1: Go to Azure Portal.

Step 2: Navigate to search bar and type resource group.

![alt text](image-3.png)

Step 3: Click on create new resource group.

![alt text](image-1.png)

Step 4: Select subscription and add name to resource group.

![alt text](image.png)

Step 5: Click in review and create.

Resource group will be created.

![alt text](image-2.png)

Step 6: Select the resource group created and click on settings > Locks

![alt text](image-4.png)

Step 7: Click on Add lock and add name to the lock and lock type : read only

![alt text](image-5.png)

**Assignment 2: Deploy an Azure Virtual Machine (Linux/Windows) via the Portal and explore:Network configuration, Disk types, VM size options**

Step 1: Go to Azure portal and navigate to search bar and search Virtual machine.

Step 2: Click on create vitrual machine.

Step 3: Add details in the basic section, disks, networking and click on review and create.

![alt text](image-6.png)

![alt text](image-7.png)

![alt text](image-8.png)

![alt text](image-9.png)

Step 4: Once after clicking on create it will prompt for downloading private key.

![alt text](image-10.png)

We can see our virtual machine has been created.

![alt text](image-11.png)

Now to access the virtual machine:

Step 1: Select virtual machine created and click on connect.

![alt text](image-12.png)

Step 2: Select native ssh for connection.

![alt text](image-13.png)

Step 3: Copy the ssh command: 

>> ssh -i ~/.ssh/id_rsa.pem azureuser@4.213.225.91

Step 4: Open Powershell and paste the command with appropriate path to private key.

![alt text](image-14.png)