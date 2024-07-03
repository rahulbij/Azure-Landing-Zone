rg = {
  rg1 = {
    resourse_group_name = "ALZ"
    location            = "canadacentral"
  }
}
Vnet = {
  Vnet1 = {
    resource_group_name  = "ALZ"
    location             = "canadacentral"
    virtual_network_name = "lz_vnet"
    address_space        = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    subnet_name          = "Frontendsub"
    resource_group_name  = "ALZ"
    virtual_network_name = "lz_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnet_name          = "AzureBastionSubnet"
    resource_group_name  = "ALZ"
    virtual_network_name = "lz_vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    subnet_name          = "Backendsub"
    resource_group_name  = "ALZ"
    virtual_network_name = "lz_vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

nsg = {
  nsg1 = {
    nsg_name             = "frontendsubnet_nsg"
    location             = "canadacentral"
    resource_group_name  = "ALZ"
    sub_name             = "Frontendsub"
    virtual_network_name = "lz_vnet"
  }

  nsg2 = {
    nsg_name             = "Backendsub_NSG"
    location             = "canadacentral"
    resource_group_name  = "ALZ"
    sub_name             = "Backendsub"
    virtual_network_name = "lz_vnet"
  }

  # nsg3 = {
  #   nsg_name             = "AzureBastionSubnetNSG"
  #   location             = "canadacentral"
  #   resource_group_name  = "ALZ"
  #   sub_name             = "AzureBastionSubnet"
  #   virtual_network_name = "lz_vnet"
  #   }
}
NIC = {
  NIC1 = {
    nic_name             = "frontend-nic"
    ipconfig ="internal_front"
    location             = "canadacentral"
    resource_group_name  = "ALZ"
    sub_name             = "Frontendsub"
    virtual_network_name = "lz_vnet"


  }

  NIC2 = {
    nic_name             = "backend-nic"
    ipconfig ="internal_back"
    location             = "canadacentral"
    resource_group_name  = "ALZ"
    sub_name             = "Backendsub"
    virtual_network_name = "lz_vnet"
  }
}

VM = {
  VM1 = {
    vm_name             = "frontvm01"
    resource_group_name = "ALZ"
    location            = "canadacentral"
    size                = "Standard_F2"
    # admin_username      = "adminuser"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
   publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    nic_name             = "frontend-nic"

  }
  VM2 = {
    vm_name             = "backendvm01"
    resource_group_name = "ALZ"
    location            = "canadacentral"
    size                = "Standard_F2"
    # admin_username      = "adminuser"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
   publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    nic_name             = "backend-nic"

  }
}

keyvault = {

  keyvault1 = {

    name = "alzrakeyvault19123456"

    location                   = "canadacentral"
    resource_group_name        = "ALZ"
    soft_delete_retention_days = "7"
    sku_name                   = "standard"


  }
}

lb = {

  lb1 = {

    PIP_name                  = "PublicIPForLB"
    sku                 = "Standard"
    location                  = "canadacentral"
    resource_group_name       = "ALZ"
    allocation_method         = "Static"
    Lb_name                   = "TestLoadBalancer"
    nic1                      = "frontend-nic"
    nic2                      = "backend-nic"
    ip_configuration_frontend = "internal_front"
    ip_configuration_backend  = "internal_back"

    probe_name                = "Probe1"
    lb_rule_name              = "mylbrule1"
    protocol                  = "Tcp"
    frontend_ip_configuration = "PublicIPAddress"
    backendpool            = "BackEndAddressPool"
    sku_type                  = "Standard"

  }
}

bastion =  {
bastion1 = {
     publicip =      "pub01"
     bastionname           = "bastionpip"
  location            = "canadacentral"
  resource_group_name = "ALZ"
  allocation_method   = "Static"
  sku                 = "Standard"
  
  
  
  sub_name ="AzureBastionSubnet"
  virtual_network_name = "lz_vnet"

}

}

