variable "domain" {
  type        = string
  default     = null
  description = "For custom domains, this is the fully-qualified domain name, such as auth.example.com. For Amazon Cognito prefix domains, this is the prefix alone, such as auth."
}

variable "certificate_arn" {
  type        = string
  default     = null
  description = "The ARN of an ISSUED ACM certificate in us-east-1 for a custom domain."
}

variable "identity_providers" {
  type = list(object(
    {
      name              = string
      type              = string
      provider_details  = map(string)
      attribute_mapping = map(string)
      idp_identifiers   = list(string)
    }
  ))
  default     = []
  description = "A list of identity providers to associate with Cognito user pool."
}
