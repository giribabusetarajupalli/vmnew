resource "azurerm_resource_group" "main" {
  name = var.rg_name
  location = var.rg_location
}

resource "azurerm_virtual_network" "main" {
  name = var.vnet_name
  resource_group_name =  azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  address_space = var.vnet_address_space

}
resource "azurerm_subnet" "main" {
  name = var.subnet_name
  address_prefixes = var.subnet_address_space
  resource_group_name =  azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
}
resource "azurerm_network_interface" "main" {
  name = var.nic_name
  resource_group_name =  azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  ip_configuration {
    name = "ipconfig"
    private_ip_address_allocation = "dynamic"
    subnet_id = azurerm_subnet.main.id
  }
}
resource "azurerm_public_ip" "main" {
 name = var.pip_name
 resource_group_name =  azurerm_resource_group.main.name
 location = azurerm_resource_group.main.location
 allocation_method = "Dynamic"
  
}
resource "azurerm_network_security_group" "main" {
  name = var.NSG_name
  resource_group_name =  azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  
}
resource "azurerm_windows_virtual_machine" "main" {
  name = var.vm_name
  resource_group_name =  azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  network_interface_ids = [azurerm_network_interface.main.id]
  admin_username = "Giribabu"
  admin_password = "Giri@1234567"
  computer_name = "Rithvin"
  size = var.vm_size
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}