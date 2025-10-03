terraform {
  source = "../../modules/github"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  owner = "msanavia"
  repositories = {
    msanavia = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      description            = "GitHub Personal Profile"
      visibility             = "public"
      collaborators = {
        //"msanavia" = "admin"
      }
    }
  }
}
