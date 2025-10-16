output "compartment_id" {
  // Output compartment ID only if created
  value = length(oci_identity_compartment.compartment) > 0 ? oci_identity_compartment.compartment[0].id : null
}

