provider "azurerm" {
  features {
      prevent_deletion_if_contains_resources = false
  }
}