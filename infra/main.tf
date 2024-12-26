# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id                 = var.subscription_id
  features {}
}

# ---------------------------------------------
# Variables
# ---------------------------------------------
variable "subscription_id" {
  type = string
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "container" {
  type = string
}

variable "mysql_username" {
  type = string
}

variable "mysql_password" {
  type = string
}

variable "mysql_database" {
  type = string
}

# ---------------------------------------------
# Resource group
# ---------------------------------------------
resource "azurerm_resource_group" "rg" {
  name     = "${var.project}-${var.environment}-rg"
  location = "Japan East"
}
