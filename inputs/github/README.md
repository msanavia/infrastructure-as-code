# GitHub Unit
Github Terragrunt Unit.

### Source
[GitHub Module](../../modules/github/)

## Inputs

### Owner
Required for authentication using ENV `GITHUB_TOKEN`.

### Repositories
Creates Repositories and its settings. Full configuration example:
```terraform
my-repository-name = {
  description            = "My repository description"
  topics                 = ["topic-1", "topic-2", "..."]
  visibility             = "private" // private or public
  enable_dependabot      = true
  enable_issues          = true // omit k/v for false
  enable_discussions     = true // omit k/v for false
  enable_projects        = true // omit k/v for false
  enable_wiki            = true // omit k/v for false
  collaborators = {
    "github-username" = "push" // pull, triage, push, maintain or admin
  }
}
```
