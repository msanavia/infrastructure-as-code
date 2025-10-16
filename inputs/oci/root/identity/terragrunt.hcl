terraform {
  source = "git::https://github.com/msanavia/infrastructure-as-code.git//modules/oci-identity?ref=oci-identity/v0.1.0"
}

include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

locals {
  default_tags = include.root.locals.default_tags
  tenancy      = yamldecode(file("${find_in_parent_folders("tenancy.yaml")}"))
}

inputs = {
  region = "${local.tenancy.home_region}"
  domain = {
    compartment_id = "${local.tenancy.root_compartment_ocid}"
    display_name   = "Default"
    description    = "Default domain"
    home_region    = "${local.tenancy.home_region}"
    license_type   = "free"
    tags           = merge(local.default_tags, local.tenancy.tags, {})
  }
}
