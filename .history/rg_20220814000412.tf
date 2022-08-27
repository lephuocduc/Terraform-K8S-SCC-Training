resource "azurerm_resource_group" "rg" {
  name     = "bookRg"
  location = "West Europe"

  tags = {
    environment = "Terraform Azure"
  }
}

resource "azurerm_resource_group" "acidemobook" {
 name     = "demoBook"
 location = "West Europe"
}