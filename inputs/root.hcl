remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    path = "${get_parent_terragrunt_dir()}/.terragrunt-local-state/${path_relative_to_include()}/tofu.tfstate"
  }
}

locals {
  providers = try(yamldecode(file("${get_original_terragrunt_dir()}/providers.yaml")), [])
}

generate "terraform" {
  path      = "terraform.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {

  required_providers {
    %{if contains(local.providers, "github")}
      github = {
        source  = "integrations/github"
        version = "~> 6.0"
    }
    %{endif}
  }
}
EOF
}
