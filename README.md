# 🚀 Cloud-Based Monitoring & Anomaly Detection (Terraform + Azure)

## 📸 System Preview

### Grafana Dashboard
![Grafana](images/grafana.png)

### Prometheus Targets
![Prometheus Targets](images/prometheus-target.png)

### Zabbix Monitoring
![Zabbix](images/zabbix.png)

### Telegram Alert System
![Telegram](images/telegram.png)

---

## 📌 Project Overview

This project implements a **cloud-based monitoring and anomaly detection system** deployed on Microsoft Azure using **Terraform (Infrastructure as Code)**.

The system is designed for **small-scale environments**, providing real-time monitoring, anomaly detection, and alerting without relying on expensive enterprise solutions.

---

## 🎯 Objectives

- Automate infrastructure deployment using Terraform  
- Implement real-time monitoring for system resources  
- Detect anomalies using threshold-based triggers  
- Send real-time alerts via Telegram  
- Provide clear visualization using dashboards  

---

## 🏗️ System Architecture

### Infrastructure Layer (Terraform)
- Resource Group  
- Virtual Network  
- Ubuntu Virtual Machine  

### Monitoring Stack (Docker + Cloud-Init)
- **Zabbix** → Monitoring & alerting  
- **Prometheus** → Metrics collection (5s interval)  
- **Grafana** → Visualization dashboards  
- **Node Exporter** → System metrics  

### Alert Flow

1. Node Exporter collects system metrics  
2. Prometheus scrapes data every 5 seconds  
3. Zabbix evaluates trigger conditions  
4. Alert is triggered when threshold is exceeded  
5. Telegram bot sends notification  
6. Recovery alert is sent when system returns to normal  

---

## 🚨 Implemented Alerts

| Metric | Condition | Recovery |
|--------|----------|----------|
| CPU    | > 80%    | < 60%    |
| Memory | Threshold-based | Normal |
| Disk   | > 80% usage | < 60% |

### Features

- Real-time Telegram notifications  
- Automatic recovery alerts  
- Alert duration tracking  
- Reduced alert noise (anti-flapping logic)  

---

## 🧪 Testing & Validation

Anomalies were simulated using:

```bash
# CPU stress
stress-ng --cpu 2 --timeout 60s

# Memory stress
stress-ng --vm 1 --vm-bytes 85% --timeout 120s

# Disk stress
fallocate -l 5G testfile
```

### Results

- Alerts triggered within ~10–15 seconds
- Telegram notifications delivered instantly
- Recovery alerts confirmed system normalization
- Metrics visualized correctly in Grafana

## 📊 Monitoring & Alert Configuration

### 🔔 Zabbix Trigger Definitions
![Zabbix Triggers](images/zabbix-trigger.png)

### 📩 Zabbix Alert Actions (Telegram)
![Zabbix Actions](images/zabbix-action.png)

### 📈 Prometheus Alert Rules
![Prometheus Rules](images/prometheus-rules.png)

## ⚙️ Deployment Guide

```bash
# Initialize Terraform
terraform init

# Review plan
terraform plan

# Deploy infrastructure
terraform apply
```

Access services after deployment:

- Grafana → http://<public-ip>:3000  
- Zabbix → http://<public-ip>:8080  
- Prometheus → http://<public-ip>:9090  

## ⚠️ Challenges & Solutions

### Large File Issues in GitHub
- Problem: Terraform binaries exceeded GitHub size limit  
- Solution: Implemented `.gitignore` and cleaned repository  

### Alert Noise (False Positives)
- Problem: Frequent triggering during short spikes  
- Solution: Added recovery conditions and threshold tuning  

### Tool Integration
- Problem: Synchronizing Zabbix, Prometheus, and Grafana  
- Solution: Standardized metrics collection via Node Exporter  

### Real-Time Alerts
- Problem: Delay in alert notifications  
- Solution: Optimized trigger evaluation and Telegram integration  

## 💡 Key Features

- Fully automated cloud deployment (IaC)
- Containerized monitoring stack
- Real-time anomaly detection
- Alert + recovery workflow
- Multi-tool observability integration

## 🧰 Tech Stack

- Terraform
- Microsoft Azure
- Ubuntu Linux
- Docker & Docker Compose
- Zabbix
- Prometheus
- Grafana
- Node Exporter
- Telegram Bot API

## 🔮 Future Improvements

- HTTPS with NGINX reverse proxy
- Remote Terraform state (Azure Storage)
- Multi-node monitoring
- Kubernetes deployment
- AI-based anomaly detection

## 🧠 Skills Demonstrated

- Cloud Engineering (Azure)
- Infrastructure as Code (Terraform)
- Linux System Administration
- Monitoring & Observability
- DevOps Automation

🎯 Key Takeaway

This project demonstrates how a cost-efficient and scalable monitoring solution can be built using open-source tools and cloud infrastructure, making it suitable for small-scale environments without enterprise-level resources.

🧠 Why This Project Matters

This project demonstrates my ability to design, deploy, and monitor a complete cloud-based system using industry-relevant tools, focusing on real-world operational challenges such as alert accuracy, system visibility, and automation.
