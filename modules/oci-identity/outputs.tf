output "compartments" {
  description = "List of created compartments with name and OCID (empty list if none)"
  value = [for c in oci_identity_compartment.compartments : {
    name = c.name
    id   = c.compartment_id
  }]
}

