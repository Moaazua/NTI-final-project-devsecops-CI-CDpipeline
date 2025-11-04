# 🚀 NTI DevSecOps Final Project: Cloud-Native CI/CD Pipeline

A fully automated **DevSecOps pipeline** deployed on AWS — integrating Infrastructure-as-Code, Continuous Integration, Continuous Deployment, and Observability in one unified system.

This project showcases how to build, secure, and monitor modern containerized applications using **Terraform, Ansible, Docker, Jenkins, Kubernetes, Prometheus, and Grafana.**

------------------------------------------------------------

## 🧱 Architecture Overview
This project implements a complete DevOps pipeline that automates the provisioning, deployment, and monitoring of a cloud-native application on AWS.

1️⃣ Infrastructure (Terraform)

Creates AWS VPC with public and private subnets.

Deploys EKS Cluster with 2 worker nodes and an Auto Scaling Group.

Creates Application Load Balancer (ALB) for traffic distribution.

Launches EC2 instance for Jenkins.

Provisions RDS database with credentials stored in AWS Secrets Manager.

Creates ECR repository for Docker images.

Configures S3 for ELB access logs and AWS Backup for daily Jenkins snapshots.

2️⃣ Configuration Management (Ansible)

Installs and configures Jenkins with required plugins.

Installs CloudWatch Agent on all EC2 instances for monitoring and logging.

3️⃣ Containerization (Docker)

Builds Docker images for the web application.

Uses docker-compose to run the full app locally (app + dependencies).

4️⃣ Orchestration (Kubernetes)

Defines Kubernetes manifests (deployment.yaml, service.yaml, networkpolicy.yaml).

Applies manifests to AWS EKS cluster.

Implements Network Policies to ensure secure communication between pods.

5️⃣ CI/CD (Jenkins)

Multi-branch pipeline triggered on every GitHub push.

Pipeline stages:

SonarQube quality check (fail if gate not passed).

Build Docker image and scan with Trivy.

Push image to ECR.

Deploy updated image to EKS using Helm charts.

6️⃣ Monitoring (Prometheus & Grafana)

Deploys Prometheus for pod and node monitoring using service discovery.

Creates CPU/RAM alerts (trigger when usage >80%).

Visualizes system and app status using Grafana dashboards.

<h2>Project Technology Stack</h2>

<table style="width:100%; border-collapse: collapse; background-color: #1e1e1e; color: #ffffff; text-align: left;">
  <thead>
    <tr style="border-bottom: 2px solid #555;">
      <th style="padding: 10px;">Layer</th>
      <th style="padding: 10px;">Technology</th>
    </tr>
  </thead>
  <tbody>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">Frontend</td>
      <td style="padding: 8px;">React, Tailwind CSS, Vite</td>
    </tr>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">Backend</td>
      <td style="padding: 8px;">Node.js, Express</td>
    </tr>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">Database</td>
      <td style="padding: 8px;">AWS DynamoDB</td>
    </tr>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">Storage</td>
      <td style="padding: 8px;">AWS S3</td>
    </tr>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">Infra as Code</td>
      <td style="padding: 8px;">Terraform</td>
    </tr>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">Config Mgmt</td>
      <td style="padding: 8px;">Ansible</td>
    </tr>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">CI/CD</td>
      <td style="padding: 8px;">Jenkins, GitHub</td>
    </tr>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">Containers</td>
      <td style="padding: 8px;">Docker, Docker Compose (local)</td>
    </tr>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">Orchestration</td>
      <td style="padding: 8px;">Kubernetes (EKS), NGINX Ingress</td>
    </tr>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">Quality Gates</td>
      <td style="padding: 8px;">SonarQube, Trivy</td>
    </tr>
    <tr style="border-bottom: 1px solid #555;">
      <td style="padding: 8px;">Monitoring</td>
      <td style="padding: 8px;">Prometheus, Grafana, Alertmanager</td>
    </tr>
    <tr>
      <td style="padding: 8px;">Notifications</td>
      <td style="padding: 8px;">Slack webhook</td>
    </tr>
  </tbody>
</table>

--------------------------------------------------

## 🗂️ Project Structure
## 📂 Project Structure

```text
nti-devsecops-project/
├── terraform/
│   ├── README.md
│   ├── modules/
│   │   ├── vpc/
│   │   ├── eks/
│   │   ├── rds/
│   │   ├── ec2-jenkins/
│   │   ├── s3/
│   │   ├── ecr/
│   │   └── backup/
│   ├── environments/
│   │   └── prod/
│   │       └── main.tf
├── ansible/
│   ├── inventory.ini
│   ├── playbooks/
│   │   ├── install_jenkins.yml
│   │   └── install_cloudwatch_agent.yml
│   └── roles/
│       ├── jenkins/
│       └── cloudwatch/
├── docker/
│   ├── app/
│   │   ├── Dockerfile
│   │   └── src/
│   └── docker-compose.yml
├── k8s/
│   ├── manifests/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   └── networkpolicy.yaml
│   └── helm-chart/   # skeleton for your app chart
├── jenkins/
│   └── Jenkinsfile   # multibranch pipeline
├── monitoring/
│   ├── prometheus/
│   │   ├── prometheus-rules.yml
│   ├── grafana/
│   │   └── grafana-dashboard.json
└── README.md

 ```

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
👤 Moaaz Essam
🎓 NTI DevSecOps Track — Final Project






