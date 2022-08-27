#Create public ip for VM
resource "azurerm_public_ip" "pip" {
  count = var.number_VM
  name                = "Ubuntu-publicip-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku = "Basic"
}

#Create Network Security Group and rule
resource "azurerm_network_security_group" "NetworkNSG" {
  count = var.number_VM
  name                = "Ubuntu-NSG-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#Create NIC for VM
resource "azurerm_network_interface" "nic" {
  count = var.number_VM
  name                = "Ubuntu-nic-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "NSG-NIC" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.NetworkNSG.id
}

#Create Linux VM
resource "azurerm_linux_virtual_machine" "linux_VM" {
  count = var.number_VM
  name                = "Ubuntu-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  admin_password = "P@ssw0rd111"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    count = var.number_VM
    name                 = "Ubuntu-OsDisk-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}