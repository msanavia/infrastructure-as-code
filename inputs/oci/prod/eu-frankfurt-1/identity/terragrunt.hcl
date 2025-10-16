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
  compartment  = yamldecode(file("${find_in_parent_folders("compartment.yaml")}"))
  region       = yamldecode(file("${find_in_parent_folders("region.yaml")}"))
}

inputs = {
  region = "${local.region.region}"
  compartment = {
    name        = "${local.compartment.name}"
    description = "The ${local.compartment.name} Sub-Compartment of the tenancy"
    parent      = "${local.tenancy.root_compartment_ocid}"
    tags        = merge(local.default_tags, local.tenancy.tags, local.compartment.tags, local.region.tags, {})
  }
}
