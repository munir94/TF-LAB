
#/*
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.28.0"
  #prodsubcription
   subscription_id = "7accd93c-0ecb-4767-aabc-2b856d78704a" 
}

# Create a resource group
resource "azurerm_resource_group" "DEV" {
  name     = "DEV-RG"
  location = "Southeast Asia"
  tags = {
        environment = "Terraform"
    }
}

# Create a virtual network within the resource group

resource "azurerm_virtual_network" "DEV-vNet" {
    name                = "DEV-vNET"
    address_space       = ["192.168.3.0/24"]
    location            = "Southeast asia"
    resource_group_name = "${azurerm_resource_group.DEV.name}"
    tags = {
        environment = "Terraform"
    }
}

resource "azurerm_subnet" "prod-frondend-subnet" {
    name                 = "DEV-WEB-SUBNET"
    resource_group_name  = "${azurerm_resource_group.DEV.name}"
    virtual_network_name = "${azurerm_virtual_network.DEV-vNet.name}"
    address_prefix       = "192.168.3.0/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-WEB-DEV.id}"
}

resource "azurerm_subnet" "prod-app-subnet" {
    name                 = "PROD-APP-SUBNET"
    resource_group_name  = "${azurerm_resource_group.PROD.name}"
    virtual_network_name = "${azurerm_virtual_network.PROD-vNet.name}"
    address_prefix       = "192.168.3.16/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-APP-DEV.id}"

}
resource "azurerm_subnet" "dev-DB-subnet" {
    name                 = "DEV-DB-SUBNET"
    resource_group_name  = "${azurerm_resource_group.DEV.name}"
    virtual_network_name = "${azurerm_virtual_network.DEV-vNet.name}"
    address_prefix       = "192.168.3.32/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-DB-DEV.id}"
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

