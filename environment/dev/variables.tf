# ---------------------------------------------------------
# Resource Group Variables
# ---------------------------------------------------------
variable "resource_group" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

# ---------------------------------------------------------
# Network Security Group (NSG) Variables
# ---------------------------------------------------------
variable "network_security_group" {
  type = map(object({
    nsg_name             = string
    location             = string
    rg_name              = string
    subnet_name          = string
    virtual_network_name = string
    nic_name             = string
    tags                 = optional(map(string))

    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

# ---------------------------------------------------------
# Public IP Variables
# ---------------------------------------------------------
variable "public_ip" {
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
    tags              = optional(map(string))
  }))
}
# ---------------------------------------------------------
# Bastion Host Variables
# ---------------------------------------------------------

variable "bastion_host" {
  type = map(object({
    bastion_name         = string
    rg_name              = string
    location             = string
    pip_name             = string
    subnet_name          = string
    virtual_network_name = string
    ip_configuration = map(object({
      name = string
    }))
  }))
}



# ---------------------------------------------------------
# Virtual Network (VNet + Subnets) Variables
# ---------------------------------------------------------
variable "virtual_network" {
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)
    dns_servers   = optional(list(string))
    managed_by    = optional(string)
    tags          = optional(map(string))

    subnet = list(object({
      subnet_name      = string
      address_prefixes = list(string)
      security_group   = optional(string)
    }))
  }))
}

# ---------------------------------------------------------
# Network Interface Card (NIC) Variables
# ---------------------------------------------------------
variable "nic" {
  type = map(object({
    nic_name            = string
    location            = string
    rg_name             = string
    subnet_name         = string
    virtual_network_name = string
    tags                = optional(map(string))

    ip_configuration = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}

# ---------------------------------------------------------
# Linux Virtual Machine Variables
# ---------------------------------------------------------
variable "linux_virtual_machine" {
  type = map(object({
    vm_name  = string
    location = string
    rg_name  = string
    size     = string
    nic_name = string
    tags     = optional(map(string))

    os_disk = map(object({
      caching              = string
      storage_account_type = string
    }))

    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
  }))
}
