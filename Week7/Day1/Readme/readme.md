**Assignment: Create a basic minikube cluster on local system. Create a namespace and deploy an ubuntu POD in it.**

Run the following commands:

1. Initialize minikube

>> minikube start

![alt text](image.png)

2. Create namespace

>> kubectl create namespace ubuntu-namespace

![alt text](image-4.png)

3. Create yaml file for pod creation

![alt text](image-1.png)

4. Run the following command to create pod

>> kubectl apply -f <pod_file_name>

![alt text](image-2.png)

5. Get interactive shell access to a running pod

![alt text](image-3.png)
