locals {
  dependabot_enabled = {
    for k, v in var.repositories : k => v if v.dependabot_enable != false
  }
  public_repositories = {
    for k, v in var.repositories : k => v if v.visibility == "public"
  }
  repository_collaborators = flatten([
    for repo_name, repo_config in var.repositories : [
      for username, permission in lookup(repo_config, "collaborators", {}) : {
        repo_name  = repo_name
        username   = username
        permission = permission
      }
    ]
  ])
  branch_prefixes = ["chore", "fix", "feature", "release", "hotfix", "bug", "test", "docs"]
  branch_patterns = [for prefix in local.branch_prefixes : "${prefix}/**/*"]
}
