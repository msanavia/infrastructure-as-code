locals {
  dependabot_enabled = {
    for k, v in var.repositories : k => v if v.enable_dependabot == true
  }
  public_repositories = {
    for k, v in var.repositories : k => v if v.visibility == "public"
  }
  repository_collaborators = flatten([
    for repo_name, repo_config in var.repositories : [
      for username, permission in coalesce(lookup(repo_config, "collaborators", null), {}) : {
        repo_name  = repo_name
        username   = username
        permission = permission
      }
    ]
  ])
}
