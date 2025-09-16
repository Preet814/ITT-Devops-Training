# 🚀 Final DevOps Project — Web App Deployment on AWS with RDS Backend

This project demonstrates the complete infrastructure setup and CI/CD pipeline automation for deploying a **Python Flask web application** with a **MySQL RDS backend** on **AWS Cloud**, using best practices and DevOps tools covered over the last 8 weeks.

---

## 🧰 Tools & Technologies Used

![Tools Used](image-3.png)

- **Terraform** – Infrastructure as Code  
- **Jenkins** – CI/CD Pipeline  
- **Docker** – Containerization  
- **Amazon Web Services (AWS)** – Cloud Infrastructure  
- **Kubernetes (Minikube)** – Local container orchestration  
- **GitHub** – Source Control & Webhooks  

---

## 🏗️ Architecture Overview

![Architecture](image-1.png)

### 🔄 Application Flow

![Flow](image.png)

**Architecture Highlights:**

- Users access the application **via the internet**.
- Traffic first passes through **AWS WAF (Web Application Firewall)** to block malicious requests.
- Requests reach the **Application Load Balancer (ALB)**.
- The ALB routes traffic to two **EC2 instances** (Web App 1 and Web App 2) deployed in **public subnets** for high availability.
- EC2 instances communicate with a **MySQL RDS** database located in a **private subnet**.
- The setup runs inside a **custom VPC**, ensuring security, isolation, and network segmentation as per AWS best practices.

---

## 🔁 CI/CD Pipeline Flow

![CI/CD Flow](image-2.png)

This project uses Jenkins pipelines to automate both infrastructure provisioning and application deployment.

### 🧩 Flow Description:

1. Developer pushes code to the [**Application Code Repository**](https://github.com/Preet814/Devops-ITT-FinalProject-Code).
2. Jenkins master triggers a job on the **Jenkins agent/slave** via GitHub webhook.
3. The agent:
   - Builds a **Docker image** from the Flask application.
   - Pushes the image to **Amazon Elastic Container Registry (ECR)**.
4. A second Jenkins job:
   - Pulls the image from ECR.
   - Deploys it to **two EC2 instances** using secure SSH.
5. Infrastructure provisioning (VPC, EC2, RDS, ALB, IAM, etc.) is handled through a Jenkins pipeline using [**Terraform Infrastructure Repository**](https://github.com/Preet814/Devops-ITT-FinalProject-Infrastructure).

---

## 📂 GitHub Repositories

- 🧱 **Infrastructure Code (Terraform + Jenkinsfile)**  
  🔗 [Devops-ITT-FinalProject-Infrastructure](https://github.com/Preet814/Devops-ITT-FinalProject-Infrastructure)

- 🌐 **Web Application Code (Python Flask)**  
  🔗 [Devops-ITT-FinalProject-Code](https://github.com/Preet814/Devops-ITT-FinalProject-Code)

---

## 🧪 Local Deployment with Minikube (Bonus)

Run the Flask web application and MySQL database on your local Minikube cluster:

```bash
minikube start
minikube addons enable metrics-server

kubectl create namespace flask-app

kubectl create secret docker-registry regcred \
  --docker-server=867344449786.dkr.ecr.ap-south-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region ap-south-1) \
  -n flask-app

kubectl apply -f application_service.yaml
kubectl apply -f deployment.yaml
kubectl apply -f hpa.yaml
kubectl apply -f mysql_cred_secret.yaml
kubectl apply -f mysql_stateful_set.yaml
kubectl apply -f storage_class.yaml
kubectl apply -f mysql_svc.yaml

minikube service flask-service -n flask-app
```

![minikube](image-4.png)

Output on browser:

![UI view](image-5.png)