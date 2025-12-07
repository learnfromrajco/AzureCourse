terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.10"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "d9c465fa-1d5d-4731-a0fe-2bd406dd141d"
  tenant_id       = "447b1d02-9cdb-4da7-884e-f3e20239a6de"
}
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.cluster_name}-dns"

  # Use Managed Identity
  identity {
    type = "SystemAssigned"
  }

  # Minimum node pool definition
  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  # Basic RBAC
  role_based_access_control_enabled = true

  tags = var.tags
}
