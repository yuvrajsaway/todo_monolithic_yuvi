resource_group = {
  rg1 = {
    rg_name    = "yuvi_devrg01"
    location   = "eastus"
    managed_by = "devlopment_team_a"
    tags = {
      Environment = "Dev"
      Owner       = "Team A"

    }
  }
}

network_security_group = {
  frontnsg01 = {
    nsg_name             = "frontnsg01"
    location             = "eastus"
    rg_name              = "yuvi_devrg01"
    subnet_name          = "frontend_subnet01"
    virtual_network_name = "yuvi_vnet01"
    nic_name             = "nic01"
    tags = {
      Environment = "Dev"
      Owner       = "Team A"
    }
    security_rules = [{
      name                       = "security_rules01"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      }
    ]
  }
}

virtual_network = {
  vnet01 = {
    vnet_name     = "yuvi_vnet01"
    location      = "eastus"
    rg_name       = "yuvi_devrg01"
    address_space = ["20.1.0.0/16"]
    dns_servers   = ["20.1.0.4", "20.1.0.5"]
    managed_by    = "devlopment_team_a"
    tags = {
      Environment = "Dev"
      Owner       = "Team A"
    }
    subnet = [{
      subnet_name      = "frontend_subnet01"
      address_prefixes = ["20.1.1.0/24"]
      #security_group   = ""
      },
      {
        subnet_name      = "backend_subnet01"
        address_prefixes = ["20.1.2.0/24"]
        #security_group   = ""
      },
      {
        subnet_name      = "AzureBastionSubnet"
        address_prefixes = ["20.1.3.0/24"]
        #security_group   = ""
      }
    ]
  }
}


nic = {
  frontendnic01 = {
    nic_name             = "nic01"
    location             = "eastus"
    rg_name              = "yuvi_devrg01"
    subnet_name          = "frontend_subnet01"
    virtual_network_name = "yuvi_vnet01"
    tags = {
      Environment = "Dev"
      Owner       = "Team A"
    }
    ip_configuration = {
      ip_config01 = {
        name                          = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    }
    backendnic01 = {
      nic_name             = "nic02"
      location             = "eastus"
      rg_name              = "yuvi_devrg01"
      subnet_name          = "frontend_subnet01"
      virtual_network_name = "yuvi_vnet01"
      tags = {
        Environment = "Dev"
        Owner       = "Team A"
      }
      ip_configuration = {
        ip_config02 = {
          name                          = "ipconfig1"
          private_ip_address_allocation = "Dynamic"
        }
      }
    }
  }


}
linux_virtual_machine = {
  frontendvm01 = {
    vm_name  = "frontendvm01"
    location = "eastus"
    rg_name  = "yuvi_devrg01"
    size     = "Standard_B1s"
    nic_name = "nic01"
    tags = {
      Environment = "Dev"
      Owner       = "Team A"
    }
    os_disk = {
      os_disk01 ={
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      }
    }
    source_image_reference = {
      source_image_reference01 = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
      }
    }
  }

  backendvm01 = {
    vm_name  = "backendvm01"
    location = "eastus"
    rg_name  = "yuvi_devrg01"
    size     = "Standard_B1s"
    nic_name = "nic02"
    tags = {
      Environment = "Dev"
      Owner       = "Team A"
    }
    os_disk = {
      os_disk01 ={
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      }
    }
    source_image_reference = {
      source_image_reference01 = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
      }
    }
}
}