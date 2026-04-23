locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  grafana_allowed_ips = length(var.grafana_allowed_ips) > 0 ? var.grafana_allowed_ips : [var.allowed_admin_ip]

  docker_compose_content = templatefile("${path.module}/templates/docker-compose.yml.tftpl", {
    zabbix_db_name         = var.zabbix_db_name
    zabbix_db_user         = var.zabbix_db_user
    zabbix_db_password     = var.zabbix_db_password
    grafana_admin_user     = var.grafana_admin_user
    grafana_admin_password = var.grafana_admin_password
  })

  prometheus_yml_content = templatefile("${path.module}/templates/prometheus.yml.tftpl", {
    scrape_interval = var.prometheus_scrape_interval
    vm_private_ip   = module.network.vm_private_ip
  })

  alerts_yml_content = file("${path.module}/templates/alerts.yml.tftpl")

  zabbix_agent2_conf_content = templatefile("${path.module}/templates/zabbix_agent2.conf.tftpl", {
    vm_private_ip = module.network.vm_private_ip
    hostname      = var.hostname
  })

  cloud_init = templatefile("${path.module}/templates/cloud-init.yaml.tftpl", {
    hostname                   = var.hostname
    admin_username             = var.admin_username
    docker_compose_content     = local.docker_compose_content
    prometheus_yml_content     = local.prometheus_yml_content
    alerts_yml_content         = local.alerts_yml_content
    zabbix_agent2_conf_content = local.zabbix_agent2_conf_content
    telegram_bot_token         = var.telegram_bot_token
    telegram_chat_id           = var.telegram_chat_id
    smtp_server                = var.smtp_server
    smtp_port                  = var.smtp_port
    smtp_username              = var.smtp_username
    smtp_password              = var.smtp_password
    alert_email_to             = var.alert_email_to
    grafana_admin_user         = var.grafana_admin_user
  })
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.common_tags
}

module "network" {
  source                  = "./modules/network"
  project_name            = var.project_name
  environment             = var.environment
  location                = var.location
  resource_group_name     = module.resource_group.resource_group_name
  vnet_address_space      = var.vnet_address_space
  subnet_address_prefixes = var.subnet_address_prefixes
  allowed_admin_ip        = var.allowed_admin_ip
  grafana_allowed_ips     = local.grafana_allowed_ips
  tags                    = local.common_tags
}

module "linux_vm" {
  source               = "./modules/linux_vm"
  vm_name              = var.vm_name
  location             = var.location
  resource_group_name  = module.resource_group.resource_group_name
  subnet_id            = module.network.subnet_id
  network_interface_id = module.network.network_interface_id
  admin_username       = var.admin_username
  ssh_public_key       = var.ssh_public_key
  vm_size              = var.vm_size
  os_disk_size_gb      = var.os_disk_size_gb
  custom_data          = base64encode(local.cloud_init)
  tags                 = local.common_tags
}