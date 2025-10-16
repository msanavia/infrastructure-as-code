resource "github_repository" "repository" {
  for_each                  = var.repositories
  name                      = each.key
  description               = each.value.description
  visibility                = each.value.visibility
  topics                    = each.value.topics
  auto_init                 = true
  delete_branch_on_merge    = true
  vulnerability_alerts      = true
  archive_on_destroy        = true
  allow_update_branch       = true
  allow_auto_merge          = true
  has_issues                = each.value.enable_issues != null ? each.value.enable_issues : false
  has_discussions           = each.value.enable_discussions != null ? each.value.enable_discussions : false
  has_projects              = each.value.enable_projects != null ? each.value.enable_projects : false
  has_wiki                  = each.value.enable_wiki != null ? each.value.enable_wiki : false
  squash_merge_commit_title = "PR_TITLE"
}
resource "github_repository_ruleset" "branch_main_ruleset" {
  // Branch Rulesets and Protection on Private Repositories requires a GitHub Pro account
  for_each    = local.public_repositories
  repository  = each.key
  name        = "Branch Main Ruleset"
  target      = "branch"
  enforcement = "active"
  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }
  bypass_actors {
    actor_id    = 5
    actor_type  = "RepositoryRole"
    bypass_mode = "pull_request"
  }
  rules {
    creation                = true
    update                  = true
    deletion                = true
    non_fast_forward        = true
    required_linear_history = true
    pull_request {
      dismiss_stale_reviews_on_push     = true
      require_code_owner_review         = true
      required_approving_review_count   = 1
      require_last_push_approval        = true
      required_review_thread_resolution = true
    }
  }
  depends_on = [github_repository.repository]
}
resource "github_repository_dependabot_security_updates" "dependabot" {
  for_each   = local.dependabot_enabled
  repository = github_repository.repository[each.key].id
  enabled    = true
}
resource "github_repository_collaborator" "collaborators" {
  for_each   = { for c in local.repository_collaborators : "${c.repo_name}:${c.username}" => c }
  repository = each.value.repo_name
  username   = each.value.username
  permission = each.value.permission
  depends_on = [github_repository.repository]
}
