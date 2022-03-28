# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {## utworzenie resource grupy
  name     = var.resource_group_name
  location = "westus2"

     tags = {
     Environment = "Terraform Getting Started"
     Team = "DevOps"
   }
}
resource "azurerm_virtual_network" "vnet" {## utworzenie virtual network 
    name                = "myTFVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "westus2"
    resource_group_name = azurerm_resource_group.rg.name
}