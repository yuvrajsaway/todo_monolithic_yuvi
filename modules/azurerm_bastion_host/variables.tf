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
