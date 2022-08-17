variable "auto_verified_attributes" {
  type        = list(string)
  default     = ["email"]
  description = "Attributes to be auto-verified. Valid values: email, phone_number."
}

variable "username_attributes" {
  type        = list(string)
  default     = ["email"]
  description = "Whether email addresses or phone numbers can be specified as usernames when a user signs up. Conflicts with alias_attributes."
}

variable "allow_admin_create_user_only" {
  type        = bool
  default     = true
  description = "Set to False if users can sign themselves up via an app."
}

variable "password_policy" {
  type = object(
    {
      minimum_length                   = number
      require_lowercase                = bool
      require_numbers                  = bool
      require_symbols                  = bool
      require_uppercase                = bool
      temporary_password_validity_days = number
    }
  )
  default = {
    minimum_length                   = 8
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 3
  }

  description = "Configuration blocked for information about the user pool password policy."
}

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

variable "groups" {
  type = list(object(
    {
      name       = string
      precedence = number
    }
  ))
  default     = []
  description = "A list of Cognito user groups to create."
}
