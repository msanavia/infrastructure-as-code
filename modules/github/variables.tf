variable "owner" {
  description = "GitHub account to manage."
  type        = string
}
variable "repositories" {
  description = "A map of repositories."
  type = map(object({
    description        = string
    topics             = optional(list(string), null)
    visibility         = string
    enable_dependabot  = bool
    enable_issues      = optional(bool)
    enable_discussions = optional(bool)
    enable_projects    = optional(bool)
    enable_wiki        = optional(bool)
    collaborators      = optional(map(string))
  }))
}
