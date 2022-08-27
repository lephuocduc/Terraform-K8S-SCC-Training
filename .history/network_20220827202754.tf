resource "azurerm_public_ip" "pip" {
  name                = var.ip-name
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  name                = "book-nic"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "bookipconfig"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}