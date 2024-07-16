# Configure the Azure provider
terraform {
  cloud {
    organization = "itsjustme"
    workspaces {
      name = "first-ever"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my-apps" {
  name     = "my-apps"
  location = "westeurope"
}

resource "azurerm_static_site" "landing" {
  location            = azurerm_resource_group.my-apps.location
  name                = "landing"
  resource_group_name = azurerm_resource_group.my-apps.name
}

