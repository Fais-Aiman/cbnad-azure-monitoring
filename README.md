# Cloud-Based Monitoring & Anomaly Detection (Terraform + Azure)

## 📌 Overview
This project implements a cloud-based monitoring and anomaly detection system deployed on Microsoft Azure using Terraform.

The infrastructure is fully automated using Infrastructure as Code (IaC), and the monitoring stack is deployed using Docker Compose with cloud-init.

## ⚙️ Architecture

- Terraform provisions:
  - Resource Group
  - Virtual Network
  - Ubuntu Virtual Machine

- cloud-init bootstraps the VM and deploys:
  - Zabbix (Monitoring & Alerting)
  - Prometheus (Metrics collection)
  - Grafana (Visualization dashboards)
  - Node Exporter

- Alert system:
  - Zabbix triggers anomalies
  - Telegram bot sends real-time alerts
  - Recovery alerts are automatically sent

## 🚨 Implemented Alerts

- CPU Usage > 80%
- Memory Usage threshold
- Disk Usage (filesystem-based)

Features:
- Real-time Telegram notifications
- Recovery detection (no alert flapping)
- Duration tracking

## 🧪 Testing

Anomalies were simulated using:

- CPU:
  stress-ng --cpu 2 --timeout 60s

- Memory:
  stress-ng --vm 1 --vm-bytes 85% --timeout 120s

- Disk:
  fallocate used to simulate storage usage

Results:
- Alerts triggered correctly
- Recovery alerts sent
- Metrics visualized in Grafana

## 🧰 Tech Stack

- Terraform
- Microsoft Azure
- Ubuntu VM
- Docker & Docker Compose
- Zabbix
- Prometheus
- Grafana
- Node Exporter
- Telegram Bot API

## 💡 Key Features

- Automated infrastructure deployment
- Containerized monitoring stack
- Real-time anomaly detection
- Alert + recovery system
- Multi-tool observability

## 🚀 Future Improvements

- Reverse proxy (NGINX + HTTPS)
- Remote Terraform state (Azure Storage)
- Kubernetes deployment
- AI-based anomaly detection
- Multi-node monitoring

## 🧠 Skills Demonstrated

- Cloud Engineering (Azure)
- Infrastructure as Code (Terraform)
- Linux & VM Management
- Monitoring & Observability
- DevOps Practices
