**Assignment: Create a Jenkinsfile for a pipeline Job for deploying static website over Apache server**

1. Created index.html file with static html page.

2. Created an EC2 instance for apache server and added http port 80 in security group.

![alt text](image.png)

3. Inside the EC2 instance installed apache2 bu running the commands:

>> sudo apt-get update
>> sudo apt-get install apache2 -y
>> sudo systemctl service apache2 enable

4. Installed ssh agent plugin in jenkins

![alt text](image-1.png)

5. Wrote jenkinsfile along with index.html and uploaded to github

![alt text](image-2.png)

6. In Jenkins UI created an item with item type pipeline

![alt text](image-3.png)

7. Configured pipeline in item :

![alt text](image-4.png)

![alt text](image-5.png)

8. Selected build now:

![alt text](image-6.png)

9. Check the server by copying public ip and pasting it to browser:

![alt text](image-7.png)
