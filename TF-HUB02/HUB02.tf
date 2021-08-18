
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.28.0"
  #PRODsubcription
   subscription_id = "xxxxxxxx" 
}

# Create a resource group
resource "azurerm_resource_group" "PROD01" {
  name     = "PROD01-RG"
  location = "Southeast Asia"
  tags = {
        environment = "Terraform"
    }
}

# Create a virtual network within the resource group

resource "azurerm_virtual_network" "PROD01-vNet" {
    name                = "PROD01-vNET"
    address_space       = ["192.168.2.0/24"]
    location            = "Southeast asia"
    resource_group_name = "${azurerm_resource_group.PROD01.name}"
    tags = {
        environment = "Terraform"
    }
}

resource "azurerm_subnet" "PROD01-frondend-subnet" {
    name                 = "PROD01-WEB-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD01.name}"
    virtual_network_name = "${azurerm_virtual_network.PROD01-vNet.name}"
    address_prefix       = "192.168.2.0/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-WEB01.id}"
}

resource "azurerm_subnet" "PROD01-app-subnet" {
    name                 = "PROD01-APP-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD01.name}"
    virtual_network_name = "${azurerm_virtual_network.PROD01-vNet.name}"
    address_prefix       = "192.168.2.16/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-APP01.id}"

}
resource "azurerm_subnet" "PROD01-DB-subnet" {
    name                 = "PROD01-DB-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD01.name}"
    virtual_network_name = "${azurerm_virtual_network.PROD01-vNet.name}"
    address_prefix       = "192.168.2.32/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-DB01.id}"
}
/*
resource "azurerm_subnet" "PROD01-PROD01SVC-subnet" {
    name                 = "PROD01-PROD01SVC-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD01.name}"
    virtual_network_name = "${azurerm_virtual_network.PROD01-vNet.name}"
    address_prefix       = "192.168.2.48/28"
    network_security_group_id ="${azurerm_network_security_group.NS.id}"
}
*/

/*
resource "azurerm_subnet" "PROD01-DB-subnet" {
    name                 = "PROD01-DB-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD01.name}"
    virtual_network_name = "${azurerm_virtual_network.PROD01-vNet.name}"
    address_prefix       = "192.168.2.64/28"
}
*/

