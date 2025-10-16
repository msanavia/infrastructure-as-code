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
resource "oci_identity_compartment" "compartment" {
  // Create compartment only if variable is set
  count          = var.compartment == null ? 0 : 1
  name           = var.compartment.name
  description    = var.compartment.description
  compartment_id = var.compartment.parent
  freeform_tags  = var.compartment.tags
}
