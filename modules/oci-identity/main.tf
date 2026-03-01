resource "oci_identity_domain" "default" {
  // Create domain only if variable is set
  count          = var.domain == null ? 0 : 1
  compartment_id = var.domain.compartment_id
  description    = var.domain.description
  display_name   = var.domain.display_name
  home_region    = var.domain.home_region
  freeform_tags  = var.domain.tags
  license_type   = "free"
}

resource "oci_identity_compartment" "compartments" {
  for_each       = var.compartments
  name           = each.value.name
  description    = each.value.description
  compartment_id = each.value.parent
  freeform_tags  = each.value.tags
}
