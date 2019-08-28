#/*
resource "azurerm_network_security_group" "NSG-APP-DEV" {
  name                = "NSG-APP-DEV"
  location            = "${azurerm_resource_group.DEV.location}"
  resource_group_name = "${azurerm_resource_group.DEV.name}"

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

  resource "azurerm_network_security_group" "NSG-WEB-DEV" {
  name                = "NSG-WEB-DEV"
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

   resource "azurerm_network_security_group" "NSG-DB-DEV" {
  name                = "NSG-DB-DEV"
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
  #*/