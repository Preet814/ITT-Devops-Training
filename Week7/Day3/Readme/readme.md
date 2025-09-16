**Assignment: Create config maps, secrets, and volumes and assign them to already created pods.**

First create a simple pod without any secret, config maps and volumes and expose the pod.

Currently pod and service configurations are:
![alt text](image-2.png)

Creating pod and service using kubectl create command:
![alt text](image.png)

Current web page:
![alt text](image-1.png)

Now create config map and secrets and run kubectl create command:

![alt text](image-3.png)

Now delete the current pod and apply the changes in pod.yaml file and again create the pod using kubectl create command:

Now see the webpage:

![alt text](image-6.png)

