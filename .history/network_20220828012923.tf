#Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "vNet1"
  location            = "West Europe"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rg.name
}

#Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet1"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefix     = ["10.0.10.0/24"]
}