locals {
  argocd_yaml = templatefile("${path.module}/addon_content.tpl", {
    client_secret = var.argocd_sso_client_secret
    argocd_yaml   = module.kustomize.stdout
    ssh_key       = var.cicd_ssh_priv_key
  })
}

module "kustomize" {
  source  = "matti/outputs/shell"
  version = "0.2.0"
  command = "kubectl kustomize ${var.argocd_bootstrap_url}"
}

// Hack to check if output from kustomize was successful or not, set incorrect type to 'count'
resource "null_resource" "is_kustomize_correct" {
  count = module.kustomize.exit_status == "0" ? 0 : "kustomize error: ${module.kustomize.stderr}"
}
