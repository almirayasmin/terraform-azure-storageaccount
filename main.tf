variable "sa_name" {
    description = "The name of the storage account"
    type        = string
    validation {
        condition     = length(var.sa_name) >= 3 && length(var.sa_name) <= 24 && can(regex("^\\w+$", var.sa_name))
        error_message = "The storage account name must be between 3 and 24 characters."
    }
}

variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string
}

variable "location" {
    description = "The location of the resource group"
    type        = string
}

variable "account_tier" {
    description = "The tier of the storage account"
    type        = string
}

variable "account_replication_type" {
    description = "The replication type of the storage account"
    type        = string
}

resource "azurerm_storage_account" "storage" {
    name                     = var.sa_name
    resource_group_name      = var.resource_group_name
    location                 = var.location
    account_tier             = var.account_tier
    account_replication_type = var.account_replication_type
}
