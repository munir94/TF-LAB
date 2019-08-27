
resource "azurerm_network_security_group" "NSG-MGMT" {
  name                = "NSG-MGMT"
  location            = "${azurerm_resource_group.CORE.location}"
  resource_group_name = "${azurerm_resource_group.CORE.name}"

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


  resource "azurerm_network_security_group" "NSG-CORESVC" {
  name                = "NSG-CORESVC"
  location            = "${azurerm_resource_group.CORE.location}"
  resource_group_name = "${azurerm_resource_group.CORE.name}"

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

   resource "azurerm_network_security_group" "NSG-WAF" {
  name                = "NSG-WAF"
  location            = "${azurerm_resource_group.CORE.location}"
  resource_group_name = "${azurerm_resource_group.CORE.name}"

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