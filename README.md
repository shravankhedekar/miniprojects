# DevOps Mini Projects Collection

A collection of beginner-to-intermediate DevOps projects demonstrating Docker, Kubernetes, Terraform, Linux Automation, CI/CD, and Containerized Application Deployment.

---

# Project Overview

This repository contains multiple hands-on DevOps projects designed to help students and beginners understand real-world DevOps tools and workflows.

The projects cover:

- Docker Containerization
- Docker Compose
- Kubernetes Deployment & Scaling
- Terraform Infrastructure as Code
- Linux System Administration Automation
- GitHub Actions CI/CD
- Python-based Containerized Applications

---

# Repository Structure

```text
DevOps-Mini-Projects/
│
├── README.md
│
├── docker-compose/
│   ├── Dockerfile
│   ├── docker-compose.yaml
│   ├── demo.txt
│   │
│   ├── html/
│   │   ├── index.html
│   │   └── main.html
│   │
│   └── .github/
│       └── workflows/
│           └── ci.yml
│
├── kubernetes-pod-scaling/
│   ├── Dockerfile
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── delete-pod.sh
│   ├── index.html
│   │
│   └── .github/
│       └── workflows/
│           └── k8s.yml
│
├── linux-syadmin-automation/
│   ├── README.md
│   │
│   ├── Directory_Structure/
│   │   └── dir_struct.sh
│   │
│   ├── Health_Check/
│   │   └── health.sh
│   │
│   └── feature_3/
│       └── app.py
│
├── terraform-hands-on/
│   ├── providers.tf
│   ├── variables.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── README.md
│   ├── .checkov.yaml
│   ├── .tflint.hcl
│   ├── .gitignore
│   │
│   └── .github/
│       └── workflows/
│           └── ci.yml
│
└── to-do-app-docker/
    ├── Dockerfile
    ├── app.py
    ├── requirements.txt
    └── .dockerignore
```

---

# Projects Included

---

## 1. Docker Compose Project

### Objective

Deploy a multi-container web application using Docker Compose.

### Features

- Multi-container deployment
- Custom Docker image creation
- Static web hosting
- Local development environment
- Automated CI workflow

### Important Files

| File | Purpose |
|--------|---------|
| Dockerfile | Builds custom image |
| docker-compose.yaml | Defines services |
| index.html | Main webpage |
| main.html | Additional webpage |
| ci.yml | GitHub Actions pipeline |

### Run

```bash
docker-compose up -d
```

---

## 2. Kubernetes Pod Scaling

### Objective

Deploy and manage scalable applications using Kubernetes.

### Features

- Kubernetes Deployment
- Service Exposure
- Pod Management
- High Availability
- Automated CI/CD

### Important Files

| File | Purpose |
|--------|---------|
| deployment.yaml | Creates deployment |
| service.yaml | Exposes application |
| delete-pod.sh | Tests self-healing |
| Dockerfile | Builds container image |
| k8s.yml | CI workflow |

### Deploy

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### Check Pods

```bash
kubectl get pods
```

### Check Services

```bash
kubectl get svc
```

---

## 3. Linux SysAdmin Automation

### Objective

Automate common Linux administration tasks.

### Features

- Health monitoring
- Directory structure visualization
- Python automation scripts
- System maintenance

### Modules

#### Health Check

```bash
Health_Check/health.sh
```

Checks:

- CPU Usage
- Memory Usage
- Disk Usage
- System Status

Run:

```bash
bash health.sh
```

---

#### Directory Structure Generator

```bash
Directory_Structure/dir_struct.sh
```

Displays folder hierarchy.

Run:

```bash
bash dir_struct.sh
```

---

#### Python Automation

```bash
feature_3/app.py
```

Python-based automation utility.

Run:

```bash
python app.py
```

---

## 4. Terraform Hands-On

### Objective

Learn Infrastructure as Code using Terraform.

### Features

- Local resource creation
- Variables
- Outputs
- Provider configuration
- Security scanning
- Terraform linting

### Important Files

| File | Purpose |
|--------|---------|
| providers.tf | Provider definitions |
| variables.tf | Input variables |
| main.tf | Infrastructure resources |
| outputs.tf | Output values |
| .tflint.hcl | Lint configuration |
| .checkov.yaml | Security scan rules |

### Terraform Workflow

Initialize:

```bash
terraform init
```

Plan:

```bash
terraform plan
```

Apply:

```bash
terraform apply
```

Destroy:

```bash
terraform destroy
```

---

## 5. Dockerized To-Do Application

### Objective

Containerize a Python To-Do application.

### Features

- Python application
- Dockerized deployment
- Dependency management
- Portable execution

### Important Files

| File | Purpose |
|--------|---------|
| app.py | Main application |
| Dockerfile | Container definition |
| requirements.txt | Python dependencies |

### Build Image

```bash
docker build -t todo-app .
```

### Run Container

```bash
docker run -p 5000:5000 todo-app
```

---

# CI/CD Pipelines

GitHub Actions workflows are included for automated:

- Code Validation
- Docker Build Verification
- Terraform Validation
- Kubernetes Checks
- Continuous Integration

Workflow Locations:

```text
.github/workflows/
```

---

# Technologies Used

### Containerization

- Docker
- Docker Compose

### Container Orchestration

- Kubernetes

### Infrastructure as Code

- Terraform

### Automation

- Bash
- Python

### CI/CD

- GitHub Actions

### Security & Quality

- Checkov
- TFLint

---

# Learning Outcomes

After completing these projects you will understand:

- Docker Image Creation
- Container Management
- Docker Compose Networking
- Kubernetes Deployments
- Kubernetes Services
- Terraform Fundamentals
- Linux Automation
- Bash Scripting
- CI/CD Pipelines
- Infrastructure as Code Concepts

---

# Author

Shravan Khedekar

B.Tech Computer Science Engineering

DevOps | Cloud | Linux | Kubernetes | Terraform | Automation
