variable "cicd_ssh_priv_key" {
  type        = string
  description = "Private SSH key that has access to ArgoCD Applications Github repo"
  sensitive   = true
}

variable "argocd_sso_client_secret" {
  type        = string
  description = "Github Client Secret for ArgoCD SSO"
  sensitive   = true
}

variable "argocd_bootstrap_url" {
  type        = string
  description = "The Git repo URL for the ArgoCD bootstrap"
}
