# 1. GRUPO DE RECURSOS
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.prefix}-${var.environment}"
  location = var.location
}

# 2. GENERADOR DE SUFIJOS ALEATORIOS
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# 3. STORAGE ACCOUNT
resource "azurerm_storage_account" "storage" {
  name                     = "st${var.prefix}${var.environment}${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# 4. PLAN DE APP SERVICE
resource "azurerm_service_plan" "app_plan" {
  name                = "plan-${var.prefix}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1" # Capa gratuita
}

# 5. APP SERVICE
resource "azurerm_linux_web_app" "app_service" {
  name                = "app-${var.prefix}-${var.environment}-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.app_plan.id

  site_config {
    always_on = false # Debe ser false en la capa F1
  }
}
