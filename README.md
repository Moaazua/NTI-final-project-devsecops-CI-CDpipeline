# 🚀 NTI DevSecOps Final Project: Cloud-Native CI/CD Pipeline

A fully automated **DevSecOps pipeline** deployed on AWS — integrating Infrastructure-as-Code, Continuous Integration, Continuous Deployment, and Observability in one unified system.

This project showcases how to build, secure, and monitor modern containerized applications using **Terraform, Ansible, Docker, Jenkins, Kubernetes, Prometheus, and Grafana.**

------------------------------------------------------------

## 🧱 Architecture Overview

**Infrastructure Stack (Terraform):**
- AWS EKS Cluster with 2 worker nodes (Auto Scaling Enabled)
- Application Load Balancer (ELB)
- RDS Database (Credentials stored in AWS Secrets Manager)
- EC2 Instance for Jenkins Master
- ECR Repository for Docker Images
- S3 Bucket for ELB Access Logs
- Automated Jenkins Backup (AWS Backup Service)

**Configuration Management (Ansible):**
- Install and configure Jenkins + required plugins  
- Deploy CloudWatch Agent on all EC2 instances

**Application Containerization (Docker):**
- Build Docker images for microservices  
- Compose all app components locally using Docker Compose

**Kubernetes Deployment (EKS):**
- Deploy services to EKS cluster using Kubernetes manifests  
- Apply Helm Charts for versioned and easy deployment  
- Configure Network Policies for Pod-to-Pod security

**CI/CD Pipeline (Jenkins):**
- Multi-Branch Pipeline triggered on each GitHub push  
- Pipeline Stages:
  1. Code Checkout  
  2. SonarQube Code Quality Check  
  3. Docker Image Build  
  4. Trivy Security Scan  
  5. Push Image to AWS ECR  
  6. Deploy to EKS using Helm

**Monitoring (Prometheus & Grafana):**
- Prometheus monitors Pods & Nodes using Service Discovery  
- CPU/RAM usage alerts when usage exceeds 80%  
- Grafana dashboards visualize app and cluster metrics

--------------------------------------------------

## 🗂️ Project Structure
nti-devsecops-project/
│── terraform/ # Infrastructure as Code (AWS setup)
│── ansible/ # Jenkins & CloudWatch configuration
│── docker/ # Dockerfiles & Docker Compose
│── k8s/ # Kubernetes manifests & Helm charts
│── jenkins/ # Jenkinsfile (pipeline as code)
│── monitoring/ # Prometheus & Grafana setup
│── docs/ # Architecture diagram & documentation
│── README.md # Project overview
│── LICENSE

-----------------------------------------------------

📸 Architecture Diagram
<img width="2458" height="1551" alt="diagram-export-10-20-2025-2_56_10-AM" src="https://github.com/user-attachments/assets/7f56c164-f300-4c1c-9f25-c149044ca0d0" />

-------------------------------------------------

🧠 Learning Outcomes

✅ Design end-to-end CI/CD pipeline using open-source tools
✅ Apply Infrastructure as Code & Configuration Management principles
✅ Implement DevSecOps security gates (SonarQube + Trivy)
✅ Deploy & monitor workloads on AWS EKS
✅ Visualize and analyze system performance using Grafana

------------------------------------------------
🧑‍💻 Author
👤 Moaaz Essam
🎓 NTI DevSecOps Track — Final Project




ل


