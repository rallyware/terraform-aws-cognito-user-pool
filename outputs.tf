output "id" {
  value       = local.user_pool_id
  description = "ID of the user pool."
}

output "custom_domain" {
  value       = one(aws_cognito_user_pool.default[*].custom_domain)
  description = "A custom domain name that you provide to Amazon Cognito."
}

output "domain" {
  value       = local.domain
  description = "Holds the domain prefix if the user pool has a domain associated with it."
}

output "endpoint" {
  value       = one(aws_cognito_user_pool.default[*].endpoint)
  description = "Endpoint name of the user pool."
}

output "estimated_number_of_users" {
  value       = one(aws_cognito_user_pool.default[*].estimated_number_of_users)
  description = "A number estimating the size of the user pool."
}

output "creation_date" {
  value       = one(aws_cognito_user_pool.default[*].creation_date)
  description = "Date the user pool was created."
}

output "last_modified_date" {
  value       = one(aws_cognito_user_pool.default[*].last_modified_date)
  description = "Date the user pool was last modified."
}

output "cloudfront_distribution_arn" {
  value       = one(aws_cognito_user_pool_domain.default[*].cloudfront_distribution_arn)
  description = "The URL of the CloudFront distribution."
}

output "s3_bucket" {
  value       = one(aws_cognito_user_pool_domain.default[*].s3_bucket)
  description = "The S3 bucket where the static files for this domain are stored."
}

output "issuer_url" {
  value       = local.enabled ? format("https://%s", one(aws_cognito_user_pool.default[*].endpoint)) : ""
  description = "Cognito issuer URL"
}

output "auth_url" {
  value       = local.enabled ? format("https://%s.auth.%s.amazoncognito.com/oauth2/authorize", local.domain, local.region) : ""
  description = "Cognito auth URL"
}

output "token_url" {
  value       = local.enabled ? format("https://%s.auth.%s.amazoncognito.com/oauth2/token", local.domain, local.region) : ""
  description = "Cognito token URL"
}

output "userinfo_url" {
  value       = local.enabled ? format("https://%s.auth.%s.amazoncognito.com/oauth2/userInfo", local.domain, local.region) : ""
  description = "Cognito userInfo URL"
}

output "revoke_url" {
  value       = local.enabled ? format("https://%s.auth.%s.amazoncognito.com/oauth2/revoke", local.domain, local.region) : ""
  description = "Cognito revoke URL"
}

output "login_url" {
  value       = local.enabled ? format("https://%s.auth.%s.amazoncognito.com/login", local.domain, local.region) : ""
  description = "Cognito login URL"
}

output "logout_url" {
  value       = local.enabled ? format("https://%s.auth.%s.amazoncognito.com/logout", local.domain, local.region) : ""
  description = "Cognito logout URL"
}
