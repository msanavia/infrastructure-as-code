<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch_protection.enforced_prefixes](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection) | resource |
| [github_branch_protection.main_branch_protection](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.repository](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository) | resource |
| [github_repository_collaborator.collaborators](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_collaborator) | resource |
| [github_repository_dependabot_security_updates.dependabot](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_dependabot_security_updates) | resource |
| [github_user.owner](https://registry.terraform.io/providers/hashicorp/github/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_owner"></a> [owner](#input\_owner) | GitHub account to manage. | `string` | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | A map of repositories. | <pre>map(object({<br/>    archive_on_destroy = bool<br/>    dependabot_enable  = optional(bool)<br/>    description        = string<br/>    visibility         = string<br/>    topics             = optional(list(string), null)<br/>    collaborators      = map(string)<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_collaborator_invitation_ids"></a> [collaborator\_invitation\_ids](#output\_collaborator\_invitation\_ids) | A map of collaborator keys to their invitation\_id (if an invitation was sent). |
| <a name="output_repository_urls"></a> [repository\_urls](#output\_repository\_urls) | WEB and SSH-clone URLs for each repository. |
<!-- END_TF_DOCS -->