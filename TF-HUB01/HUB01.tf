
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.28.0"
  #prodsubcription
   subscription_id = "xxxxxxx" 
}

# Create a resource group
resource "azurerm_resource_group" "PROD" {
  name     = "PROD-RG"
  location = "Southeast Asia"
  tags = {
        environment = "Terraform"
    }
}

# Create a virtual network within the resource group

resource "azurerm_virtual_network" "PROD-vNet" {
    name                = "PROD-vNET"
    address_space       = ["192.168.1.0/24"]
    location            = "Southeast asia"
    resource_group_name = "${azurerm_resource_group.PROD.name}"
    tags = {
        environment = "Terraform"
    }
}

resource "azurerm_subnet" "prod-frondend-subnet" {
    name                 = "PROD-WEB-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD.name}"
    virtual_network_name = "${azurerm_virtual_network.PROD-vNet.name}"
    address_prefix       = "192.168.1.0/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-WEB.id}"
}

resource "azurerm_subnet" "prod-app-subnet" {
    name                 = "PROD-APP-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD.name}"
    virtual_network_name = "${azurerm_virtual_network.PROD-vNet.name}"
    address_prefix       = "192.168.1.16/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-APP.id}"

}
resource "azurerm_subnet" "prod-DB-subnet" {
    name                 = "PROD-DB-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD.name}"
    virtual_network_name = "${azurerm_virtual_network.PROD-vNet.name}"
    address_prefix       = "192.168.1.32/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-DB.id}"
}
/*
resource "azurerm_subnet" "prod-PRODSVC-subnet" {
    name                 = "PROD-PRODSVC-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD.name}"
    virtual_network_name = "${azurerm_virtual_network.PROD-vNet.name}"
    address_prefix       = "192.168.1.48/28"
    network_security_group_id ="${azurerm_network_security_group.NS.id}"
}
*/

/*
resource "azurerm_subnet" "prod-DB-subnet" {
    name                 = "PROD-DB-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD.name}"
    virtual_network_name = "${azurerm_virtual_network.Prod-vNet.name}"
    address_prefix       = "192.168.0.64/28"
}
*/

