variable "owner" {
  description = "GitHub account to manage."
  type        = string
}
variable "repositories" {
  description = "A map of repositories."
  type = map(object({
    archive_on_destroy = bool
    dependabot_enable  = optional(bool)
    description        = string
    visibility         = string
    topics             = optional(list(string), null)
    collaborators      = map(string)
  }))
}
