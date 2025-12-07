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