terraform {
  source = "git::https://github.com/msanavia/infrastructure-as-code.git//modules/oci-identity?ref=oci-identity/v0.2.0"
}

include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

locals {
  default_tags = include.root.locals.default_tags
  tenancy      = yamldecode(file("${find_in_parent_folders("tenancy.yaml")}"))
  # Compartments
  prd = yamldecode(file("${find_in_parent_folders("prd/compartment.yaml")}"))
}

inputs = {
  region = "${local.tenancy.home_region}"
  domain = {
    compartment_id = "${local.tenancy.ocid}"
    display_name   = "Default"
    description    = "Default domain"
    home_region    = "${local.tenancy.home_region}"
    license_type   = "free"
    tags           = merge(local.default_tags, local.tenancy.tags, {})
  }
  compartments = {
    prd = {
      name        = "${local.prd.name}"
      description = "The ${local.prd.name} Sub-Compartment of the tenancy"
      parent      = "${local.tenancy.ocid}"
      tags        = merge(local.default_tags, local.tenancy.tags, local.prd.tags, {})
    }
  }
}
