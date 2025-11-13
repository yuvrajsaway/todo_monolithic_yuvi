variable "linux_virtual_machine" {
  type = map(object({
    vm_name  = string
    location = string
    rg_name  = string
    size     = string
    tags     = optional(map(string))
    os_disk = object({
      caching              = string
      storage_account_type = number

    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
  })
  }))
}

variable "network_interface_id" {
  description = "Network interface ID to attach to VM"
  type        = string
}