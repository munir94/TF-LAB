resource "azurerm_network_security_group" "NSG-APP" {
  name                = "NSG-APP"
  location            = "${azurerm_resource_group.PROD.location}"
  resource_group_name = "${azurerm_resource_group.PROD.name}"

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

  resource "azurerm_network_security_group" "NSG-WEB" {
  name                = "NSG-WEB"
  location            = "${azurerm_resource_group.PROD.location}"
  resource_group_name = "${azurerm_resource_group.PROD.name}"

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

   resource "azurerm_network_security_group" "NSG-DB" {
  name                = "NSG-DB"
  location            = "${azurerm_resource_group.PROD.location}"
  resource_group_name = "${azurerm_resource_group.PROD.name}"

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

