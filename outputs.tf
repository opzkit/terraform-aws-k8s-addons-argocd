output "addon" {
  value = {
    content = local.argocd_yaml
    version = "0.0.1"
    name    = "argocd"
  }
}
