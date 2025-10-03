output "repository_urls" {
  description = "WEB and SSH-clone URLs for each repository."
  value = {
    for repo_name, repo in github_repository.repository :
    repo_name => {
      html_url      = repo.html_url
      ssh_clone_url = repo.ssh_clone_url
    }
  }
}

output "collaborator_invitation_ids" {
  description = "A map of collaborator keys to their invitation_id (if an invitation was sent)."
  value = {
    for key, collaborator in github_repository_collaborator.collaborators :
    key => collaborator.invitation_id
  }
}
