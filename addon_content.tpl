${argocd_yaml}
---
apiVersion: v1
stringData:
  dex.github.clientSecret: ${client_secret}
kind: Secret
metadata:
  labels:
    app.kubernetes.io/instance: argocd
    app.kubernetes.io/name: argocd-secret
    app.kubernetes.io/part-of: argocd
  name: argocd-secret
  namespace: argocd
type: Opaque
---
apiVersion: v1
data:
  sshPrivateKey: ${filebase64(ssh_key)}
kind: Secret
metadata:
  name: githubsecret
  namespace: argocd
type: Opaque
