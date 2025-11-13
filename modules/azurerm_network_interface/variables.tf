variable "nic" {
  type = map(object({
    nic_name = string
    location = string
    rg_name  = string
    subnet_name = string
    virtual_network_name = string
    tags     = optional(map(string))
    ip_configuration = map(object({
      name                          = string
      # subnet_id                     = string
      private_ip_address_allocation = string

    }))
  }))
}
