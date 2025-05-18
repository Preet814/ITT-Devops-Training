**Assignment: Set up Azure Backup to back up a VM’s disks to a Recovery Services Vault, Restore the VM using the backup image.**

1. Create a VM

Step 1: Go to azure portal and select the virtual machine service.

![alt text](image.png)

Step 2: Click on create virtual machine and add basic detials.

![alt text](image-1.png)

Step 3: Click on review and create.

![alt text](image-3.png)

Step 4: SSH into virtual machine and store some data in root folder.

![alt text](image-2.png)

2. Create recivery service vault

Step 1: Go to azure portal and click recovery service vaults.

![alt text](image-4.png)

Step 2: Click on create recovery vault and fill in basic details.

![alt text](image-5.png)

Step 3: Click on review and create.

![alt text](image-6.png)


3. Configure Backup for VM

Step 1: Open recovery vault created and click on backup in overview.

![alt text](image-7.png)

Step 2: Fill in the detials in backup goal.

![alt text](image-8.png)

Step 3: Add virtual machine for which you want to backup.

![alt text](image-9.png)

Step 4: Click on enable backup.



Step 5: Click on backup items > select virtual machine > click on 3 dots and select backup now.

![alt text](image-10.png)


4. Resotre from Backup

Step 1: In the vault, go to Backup Items > Azure Virtual Machine > Select your VM.

![alt text](image-11.png)

Step 2: Click on 3 dots and click on restore VM.

![alt text](image-12.png)

Step 3: Select the snapshot recovered and fill the details for new virtual machine.

![alt text](image-13.png)

Step 4: Click on review and create. Now a new virtual machine is created.

![alt text](image-14.png)

We can see the disk used by new VM is of restore only.

![alt text](image-15.png)