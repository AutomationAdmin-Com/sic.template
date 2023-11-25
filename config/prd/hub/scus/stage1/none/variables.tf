### Authentication Vars

variable "tenant_id" {
  description = "(Required) The Azure Active Directory `Tenant ID` property used for terraform authentication."
  type        = string
}

variable "client_id" {
  description = "(Required) The terraform Enterprise Application (Service Principal) `Application ID` property used for terraform authentication. This is the same as the `Client ID` of the associated App Registration in Azure AD."
  type        = string
}

# variable "client_secret" {
#   description = "(Required) The terraform App Registration (Service Principal) `Client secret` property used for terraform authentication."
#   type        = string
# }

variable "subscription_id" {
  description = "(Required) The Azure `Subscription ID` property used for terraform authentication. This is used to setup the default and the domain-subscription provider block `azurerm` ."
  type        = string
}

variable "hub_subscription_id" {
  description = "(Required) The Azure `Subscription ID` property used for terraform authentication. This is used to setup the hub-subscription provider block `azurerm`."
  type        = string
}

### Naming/Tagging Vars

variable "requested_for" {
  description = "(Required) Azure Devops Automatic Variable used for tagging resources."
  type        = string
}

variable "pipeline" {
  description = "(Required) Azure Devops Automatic Variable used for tagging resources."
  type        = string
}

variable "env_stage_abbr" {
  description = "(Optional) The environment stage abbreviation. Example: nonprd or prd."
  type        = string
  default     = "prd"
}

variable "region_abbr" {
  description = "(Optional) The region abbreviation. Example: scus."
  type        = string
  default     = "scus"
}

variable "sub_abbr" {
  description = "(Optional) Shortcode for the Subscription Name. Used for naming resources."
  type        = string
  default     = "hub"
}

variable "region" {
  description = "(Optional) The Azure Region."
  type        = string
  default     = "southcentralus"
}

variable "tags_app_env" {
  description = "(Optional) The App Environment. Example: dev, mot, pit, prd."
  type        = string
  default     = "dev"
}

variable "tags_nw_layer" {
  description = "(Optional) The App Network Layer. Example: internal or external."
  type        = string
  default     = "internal"
}

variable "tags_app_oc" {
  description = "(Optional) The App Contact."
  type        = string
  default     = "gerry@automationadmin.com"
}

variable "tags_cc" {
  description = "(Optional) The Cost Center for all resources deployed. Example: 113."
  type        = string
  default     = "113"
}

variable "tags_project" {
  description = "(Optional) The Project name. Example: MyFinanceApp."
  type        = string
  default     = "CentralIT"
}

variable "tags_ent_app_name" {
  description = "(Optional) The Enterprise Application name. Example: MyFinanceApp, MyITApp."
  type        = string
  default     = "CentralIT"
}

### Optional

variable "stage" {
  description = "(Optional) Which stage is this deployment? Example: 1, 2, 3."
  type        = string
  default     = "1"
}

variable "color" {
  description = "(Optional) Is this a Blue deployment or a Green deployment? Example: blue, green."
  type        = string
  default     = "blue"
}

variable "billing_scope_id" {
  description = "(Optional) Billing scope Id."
  type        = string
  default     = "null"
}



