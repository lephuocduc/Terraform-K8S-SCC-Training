# Configure the Azure Provider
provider "azurerm" {
# whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider 
  version = "=2.0.0"
  features {
  resource_group {
    prevent_deletion_if_contains_resources = false
  }
}
}