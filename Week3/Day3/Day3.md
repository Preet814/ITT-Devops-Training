**Assignment: Launch an On-demand EC2 instance with 7 GB EBS volume attached to it in AP-South-1 region. Configure your security groups such that only people within your InTimeTec network are able to SSH into it.**

**1. Create an On-demand EC2 instance configuring the security group that allow people within In Time Tec to SSH**

Step 1. Search EC2 service from search bar of AWS cloud after login.

Step 2. Select instance from left sidebar and click on create instance.

Step 3. Fill the configuration like name, instance type, key-pair, network settings.

Step 4. Edit the security group by changing inbound security group rule by type SSH, source type - custom and add In 
Time Tec CIDR block for IPV4 address range.

Step 5. Click on create instance.

**2. Create EBS Volume**

Step 1. On EC2 service page select EBS volume on left side bar and click on create EBS volume.

Step 2. Fill configuration like volume type (Gp3), Size (7 GiB), and add the availability zone similar to EC2 instance 
only and click on create volume. 

Step 3. Select the EBS volume from EBS dashboard and click on action and select attach volume.

Step 4. Add EC2 instance and device name to EBS volume.

**3. Connect to EC2 instance through powershell**

Step 1. Open powershell as administrator and write command : 

# ssh -i "path of key-pair.pem" ubuntu@<ipv4_address> 

**4. Attach file system to EBS volume**

Step 1. Check if file system is attached or not

# sudo file -s path

if the output on this command on terminal is - data then file system is not attached.

if the output is not data then file system is not attached.

Step 2. Command to attach file system to EBS volume:

# sudo mkfs -t ext4 path

This command attach file system type ext4 to EBS volume present on path.

**5. Mount EBS volume to a folder**

Step 1. Create a folder 

# mkdir folder_name

Step 2. Write command to mount EBS volume to folder 

# sudo mount path_of_EBS_volume path_of_folder

Step 3. Now you can add file and folders to your EBS volume using sudo commands.