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
| [github_repository.repository](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository) | resource |
| [github_repository_collaborator.collaborators](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_collaborator) | resource |
| [github_repository_dependabot_security_updates.dependabot](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_dependabot_security_updates) | resource |
| [github_repository_ruleset.branch_main_ruleset](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_ruleset) | resource |
| [github_user.owner](https://registry.terraform.io/providers/hashicorp/github/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_owner"></a> [owner](#input\_owner) | GitHub account to manage. | `string` | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | A map of repositories. | <pre>map(object({<br/>    description        = string<br/>    topics             = optional(list(string), null)<br/>    visibility         = string<br/>    enable_dependabot  = bool<br/>    enable_issues      = optional(bool)<br/>    enable_discussions = optional(bool)<br/>    enable_projects    = optional(bool)<br/>    enable_wiki        = optional(bool)<br/>    collaborators      = optional(map(string))<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_collaborator_invitation_ids"></a> [collaborator\_invitation\_ids](#output\_collaborator\_invitation\_ids) | A map of collaborator keys to their invitation\_id (if an invitation was sent). |
| <a name="output_repository_urls"></a> [repository\_urls](#output\_repository\_urls) | WEB and SSH-clone URLs for each repository. |
<!-- END_TF_DOCS -->