terraform {
  source = "git::https://github.com/msanavia/infrastructure-as-code.git//modules/github?ref=github/v0.1.0"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  owner = "msanavia"
  repositories = {
    advent-of-code = {
      description       = "Advent of Code solutions"
      topics            = ["advent-of-code", "python"]
      visibility        = "public"
      enable_dependabot = false
    }
    entra-id-memberships-cloner = {
      description       = "Shell script to clone memberships between 2 users or 2 groups"
      topics            = ["entra-id", "shell", "bash", "azure-cli"]
      visibility        = "public"
      enable_dependabot = true
    }
    infrastructure-as-code = {
      description       = "Monorepo for Infrastructure as Code"
      topics            = ["terragrunt", "opentofu", "terraform"]
      visibility        = "public"
      enable_dependabot = true
    }
    learning-and-development = {
      description       = "Labs for training"
      visibility        = "private"
      enable_dependabot = false
    }
    msanavia = {
      description       = "GitHub Personal Profile"
      visibility        = "public"
      enable_dependabot = false
    }
  }
}
