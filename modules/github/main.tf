resource "github_repository" "repository" {
  for_each               = var.repositories
  name                   = each.key
  description            = each.value.description
  visibility             = each.value.visibility
  topics                 = each.value.topics
  auto_init              = true
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_repository_dependabot_security_updates" "dependabot" {
  for_each   = local.dependabot_enabled
  repository = github_repository.repository[each.key].id
  enabled    = true
}

resource "github_branch_protection" "main_branch_protection" {
  for_each                        = local.public_repositories
  repository_id                   = github_repository.repository[each.key].id
  pattern                         = "main"
  lock_branch                     = true
  require_conversation_resolution = true

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}

resource "github_branch_protection" "enforced_prefixes" {
  for_each = {
    for pair in flatten([
      for repo_name in keys(github_repository.repository) : [
        for pattern in local.branch_patterns : {
          repo_name = repo_name
          pattern   = pattern
        }
      ]
    ]) : "${pair.repo_name}:${pair.pattern}" => pair
  }

  repository_id = github_repository.repository[each.value.repo_name].id
  pattern       = each.value.pattern
  lock_branch                     = true
  require_conversation_resolution = true

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}

resource "github_repository_collaborator" "collaborators" {
  for_each   = { for c in local.repository_collaborators : "${c.repo_name}:${c.username}" => c }
  repository = each.value.repo_name
  username   = each.value.username
  permission = each.value.permission
}
