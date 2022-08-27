# Configure the Azure Provider
provider "azurerm" {
# whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider 
features {
  resource_group {
      prevent_deletion_if_contains_resources = false
    }
}
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.0.0"
    }
  }
}