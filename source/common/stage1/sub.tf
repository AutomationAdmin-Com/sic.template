
data "azurerm_billing_mca_account_scope" "billing" {
  billing_account_name = var.billing_scope_id
  billing_profile_name = "OEHH-C5SJ-BG7-PGB"
  invoice_section_name = "JFC2-PT5G-PJA-PGB"
}

resource "azurerm_subscription" "nonprd_hub" {
  subscription_name = "nonprd-hub"
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billing.id
}

resource "azurerm_subscription" "nonprd_spk" {
  subscription_name = "nonprd-spoke"
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billing.id
}

resource "azurerm_subscription" "prd_spk" {
  subscription_name = "prd-spoke"
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billing.id
}
