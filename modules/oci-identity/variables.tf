variable "region" {
  description = "The OCI region to use (required for provider configuration)."
  type        = string
  default     = "eu-frankfurt-1"
}

variable "domain" {
  description = "Details of the domain to create."
  type = object({
    compartment_id = string
    display_name   = string
    description    = string
    home_region    = string
    tags           = map(string)
  })
  default = null
}

variable "compartment" {
  description = "Details of the compartment to create."
  type = object({
    name        = string
    parent      = string
    description = string
    tags        = map(string)
  })
  default = null
}
