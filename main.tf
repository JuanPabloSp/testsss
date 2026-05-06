# 1. DEFINICIÓN DEL PROVEEDOR
# Le indicamos a Terraform que vamos a interactuar con Azure (azurerm).
# Esto es la base para estandarizar la creación de entornos.
provider "azurerm" {
  features {}
}

# 2. GRUPO DE RECURSOS
# Un contenedor lógico donde vivirá toda nuestra infraestructura.
resource "azurerm_resource_group" "rg" {
  name     = "rg-az400-devops-lab"
  location = "Norway East"
}

# 3. GENERADOR DE SUFIJOS ALEATORIOS
# Como los nombres de las Storage Accounts y App Services deben ser únicos a nivel mundial,
# usamos este recurso para generar un sufijo aleatorio. 
# Esto garantiza que el entorno sea 100% reproducible sin tener que cambiar el código manualmente.
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# 4. RECURSO ADICIONAL: STORAGE ACCOUNT
# Cumple con el requisito de crear un recurso asociado.
resource "azurerm_storage_account" "storage" {
  name                     = "staz400lab${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# 5. PLAN DE APP SERVICE (Infraestructura subyacente para el hosting)
# Define la capacidad de cómputo (Linux, capa gratuita F1 para laboratorios).
resource "azurerm_service_plan" "app_plan" {
  name                = "plan-az400-lab"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

# 6. RECURSO DE HOSTING DE APLICACIÓN: APP SERVICE
# Cumple con el requisito principal de hosting.
resource "azurerm_linux_web_app" "app_service" {
  name                = "app-az400-lab-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.app_plan.id

  site_config {
    always_on = false # Debe ser false en la capa F1 (gratuita)
  }
}