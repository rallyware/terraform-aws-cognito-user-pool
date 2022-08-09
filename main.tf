locals {
  enabled      = module.this.enabled
  user_pool_id = one(aws_cognito_user_pool.default[*].id)
}

resource "aws_cognito_user_pool" "default" {
  count = local.enabled ? 1 : 0

  name = module.this.id
  tags = module.this.tags
}

resource "aws_cognito_user_pool_domain" "default" {
  count = local.enabled && var.domain != null ? 1 : 0

  domain          = var.domain
  certificate_arn = var.certificate_arn
  user_pool_id    = local.user_pool_id
}

resource "aws_cognito_identity_provider" "default" {
  for_each = { for provider in var.identity_providers : provier.name => provider }

  user_pool_id      = local.user_pool_id
  provider_name     = each.value.name
  provider_type     = each.value.type
  provider_details  = each.value.provider_details
  attribute_mapping = each.value.attribute_mapping
  idp_identifiers   = each.value.idp_identifiers
}
