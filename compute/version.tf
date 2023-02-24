terraform {
  required_version = ">= 1.1.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.11"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraformadmin"
    storage_account_name = "lterraformstorage"
    container_name       = "terraform-state"
  }
}

