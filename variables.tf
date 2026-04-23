variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "East Asia"
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
  default     = "cbnad-rg"
}

variable "project_name" {
  description = "Project prefix used in resource naming."
  type        = string
  default     = "cbnad"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "allowed_admin_ip" {
  description = "Admin public IP in CIDR format."
  type        = string
}

variable "grafana_allowed_ips" {
  description = "CIDR list allowed to reach Grafana."
  type        = list(string)
  default     = []
}

variable "admin_username" {
  description = "Linux admin username."
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key content."
  type        = string
}

variable "vm_name" {
  description = "Virtual machine name."
  type        = string
  default     = "cbnad-vm01"
}

variable "hostname" {
  description = "Linux hostname."
  type        = string
  default     = "cbnad-vm01"
}

variable "vm_size" {
  description = "Azure VM size."
  type        = string
  default     = "Standard_B2s"
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB."
  type        = number
  default     = 30
}

variable "vnet_address_space" {
  description = "VNet CIDR block."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "Subnet CIDR block(s)."
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "prometheus_scrape_interval" {
  description = "Prometheus scrape interval."
  type        = string
  default     = "5s"
}

variable "grafana_admin_user" {
  description = "Grafana admin user."
  type        = string
  default     = "admin"
}

variable "grafana_admin_password" {
  description = "Grafana admin password."
  type        = string
  sensitive   = true
}

variable "zabbix_db_name" {
  description = "Zabbix PostgreSQL database name."
  type        = string
  default     = "zabbix"
}

variable "zabbix_db_user" {
  description = "Zabbix PostgreSQL username."
  type        = string
  default     = "zabbix"
}

variable "zabbix_db_password" {
  description = "Zabbix PostgreSQL password."
  type        = string
  sensitive   = true
}

variable "telegram_bot_token" {
  description = "Telegram bot token."
  type        = string
  sensitive   = true
}

variable "telegram_chat_id" {
  description = "Telegram chat ID."
  type        = string
  sensitive   = true
}

variable "smtp_server" {
  description = "SMTP server for email alerts."
  type        = string
  default     = "smtp.gmail.com"
}

variable "smtp_port" {
  description = "SMTP port."
  type        = number
  default     = 587
}

variable "smtp_username" {
  description = "SMTP username."
  type        = string
}

variable "smtp_password" {
  description = "SMTP password or app password."
  type        = string
  sensitive   = true
}

variable "alert_email_to" {
  description = "Recipient email for alert notifications."
  type        = string
}