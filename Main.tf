resource "aws_instance" "aws_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}


resource "azurerm_resource_group" "azure_group" {
  name     = "MyResourceGroup"
  location = var.azure_location
}

resource "azurerm_linux_virtual_machine" "azure_vm" {
  name                = "YassinVM"
  location            = azurerm_resource_group.azure_group.location
  resource_group_name = azurerm_resource_group.azure_group.name
  size                = "Standard_DS1_v2"

  admin_username      = "yassinlinux"
  admin_password      = "P@ssw0rd123!"

  network_interface_ids = ["<NETWORK_INTERFACE_ID>"]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
