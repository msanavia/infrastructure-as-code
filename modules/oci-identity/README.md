<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_identity_compartment.compartments](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_compartment) | resource |
| [oci_identity_domain.default](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment"></a> [compartment](#input\_compartment) | Details of the compartment to create. | <pre>object({<br/>    name        = string<br/>    parent      = string<br/>    description = string<br/>    tags        = map(string)<br/>  })</pre> | `null` | no |
| <a name="input_compartments"></a> [compartments](#input\_compartments) | Details of the compartments to create. | <pre>map(object({<br/>    name        = string<br/>    parent      = string<br/>    description = string<br/>    tags        = map(string)<br/>  }))</pre> | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Details of the domain to create. | <pre>object({<br/>    compartment_id = string<br/>    display_name   = string<br/>    description    = string<br/>    home_region    = string<br/>    tags           = map(string)<br/>  })</pre> | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The OCI region to use (required for provider configuration). | `string` | `"eu-frankfurt-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_compartments"></a> [compartments](#output\_compartments) | List of created compartments with name and OCID (empty list if none) |
<!-- END_TF_DOCS -->