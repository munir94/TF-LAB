

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.28.0"
  #coresubcription
   subscription_id = "7accd93c-0ecb-4767-aabc-2b856d78704a" 
}

# Create a resource group
resource "azurerm_resource_group" "CORE" {
  name     = "CORE-RG"
  location = "Southeast Asia"
  tags = {
        environment = "Terraform"
    }
}

# Create a virtual network within the resource group

resource "azurerm_virtual_network" "Core-vNet" {
    name                = "CORE-vNET"
    address_space       = ["192.168.0.0/24"]
    location            = "Southeast asia"
    resource_group_name = "${azurerm_resource_group.CORE.name}"

    tags = {
        environment = "Terraform"
    }
}

resource "azurerm_subnet" "core-frondend-subnet" {
    name                 = "CORE-FE-AGWAF-SUBNET"
    resource_group_name  = "${azurerm_resource_group.CORE.name}"
    virtual_network_name = "${azurerm_virtual_network.Core-vNet.name}"
    address_prefix       = "192.168.0.0/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-WAF.id}"
}

resource "azurerm_subnet" "core-fw-subnet" {
    name                 = "CORE-FW-SUBNET"
    resource_group_name  = "${azurerm_resource_group.CORE.name}"
    virtual_network_name = "${azurerm_virtual_network.Core-vNet.name}"
    address_prefix       = "192.168.0.16/28"
    #network_security_group_id ="${azurerm_network_security_group.NSG-MGMT.id}"

}
resource "azurerm_subnet" "core-MGMT-subnet" {
    name                 = "CORE-MGMT-SUBNET"
    resource_group_name  = "${azurerm_resource_group.CORE.name}"
    virtual_network_name = "${azurerm_virtual_network.Core-vNet.name}"
    address_prefix       = "192.168.0.32/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-MGMT.id}"
}


resource "azurerm_subnet" "core-CORESVC-subnet" {
    name                 = "CORE-CORESVC-SUBNET"
    resource_group_name  = "${azurerm_resource_group.CORE.name}"
    virtual_network_name = "${azurerm_virtual_network.Core-vNet.name}"
    address_prefix       = "192.168.0.48/28"
    network_security_group_id ="${azurerm_network_security_group.NSG-CORESVC.id}"
}


/*
resource "azurerm_subnet" "core-DB-subnet" {
    name                 = "CORE-DB-SUBNET"
    resource_group_name  = "${azurerm_resource_group.CORE.name}"
    virtual_network_name = "${azurerm_virtual_network.Core-vNet.name}"
    address_prefix       = "192.168.0.64/28"
}
*/