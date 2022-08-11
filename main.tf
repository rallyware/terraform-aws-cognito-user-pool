locals {
  enabled      = module.this.enabled
  user_pool_id = one(aws_cognito_user_pool.default[*].id)
}

resource "aws_cognito_user_pool" "default" {
  count = local.enabled ? 1 : 0

  name                     = module.this.id
  tags                     = module.this.tags
  auto_verified_attributes = var.auto_verified_attributes
  username_attributes      = var.username_attributes

  admin_create_user_config {
    allow_admin_create_user_only = var.allow_admin_create_user_only
  }

  password_policy {
    minimum_length                   = var.password_policy["minimum_length"]
    require_lowercase                = var.password_policy["require_lowercase"]
    require_numbers                  = var.password_policy["require_numbers"]
    require_symbols                  = var.password_policy["require_symbols"]
    require_uppercase                = var.password_policy["require_uppercase"]
    temporary_password_validity_days = var.password_policy["temporary_password_validity_days"]
  }
}

resource "aws_cognito_user_pool_domain" "default" {
  count = local.enabled ? 1 : 0

  domain          = coalesce(var.domain, module.this.id)
  certificate_arn = var.certificate_arn
  user_pool_id    = local.user_pool_id
}

resource "aws_cognito_identity_provider" "default" {
  for_each = { for provider in var.identity_providers : provider.name => provider }

  user_pool_id      = local.user_pool_id
  provider_name     = each.value.name
  provider_type     = each.value.type
  provider_details  = each.value.provider_details
  attribute_mapping = each.value.attribute_mapping
  idp_identifiers   = each.value.idp_identifiers
}
