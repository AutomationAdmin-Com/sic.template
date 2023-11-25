
resource "random_string" "random_suffix" {
  keepers = {
    resource_group = var.resource_group_name
  }
  length  = 5
  upper   = false
  lower   = true
  numeric = true
  special = false
}
