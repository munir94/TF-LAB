resource "azurerm_network_security_group" "NSG-APP01" {
  name                = "NSG-APP01"
  location            = "${azurerm_resource_group.PROD01.location}"
  resource_group_name = "${azurerm_resource_group.PROD01.name}"

  security_rule {
    name                       = "AllowRDPFromALL"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
  }

  resource "azurerm_network_security_group" "NSG-WEB01" {
  name                = "NSG-WEB01"
  location            = "${azurerm_resource_group.PROD01.location}"
  resource_group_name = "${azurerm_resource_group.PROD01.name}"

  security_rule {
    name                       = "AllowRDPFromALL"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
  }

   resource "azurerm_network_security_group" "NSG-DB01" {
  name                = "NSG-DB01"
  location            = "${azurerm_resource_group.PROD01.location}"
  resource_group_name = "${azurerm_resource_group.PROD01.name}"

  security_rule {
    name                       = "AllowHTTPSFromALL"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
  }

