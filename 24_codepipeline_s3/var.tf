variable "project_name" {
  description = "Give the project a name. E.g test-project"
  type        = string
}

variable "github_repo" {
  description = "Specify the repo you want to use as source"
  type        = string
}

variable "github_username" {
  description = "Enter your GitHub username"
  type        = string
}

variable "github_access_token" {
  description = "Enter the personal-user-token you generated from GitHub"
  type        = string
  sensitive   = true
}
