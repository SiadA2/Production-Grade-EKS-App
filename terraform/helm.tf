# NGINX Ingress
resource "helm_release" "nginx-ingress" {
  name       = "my-redis-release"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"

  create_namespace = true 
  namespace = "nginx-ingress"
}

# Cert Manager
resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = "oci://quay.io/jetstack/charts/cert-manager:v1.19.1"
  chart      = "cert-manager"

  create_namespace = true 
  namespace = "cert-manager"
}

# ArgoCD
resource "helm_release" "argo-cd" {
  name       = "argo-cd"
  repository = "oci://quay.io/jetstack/charts/cert-manager:v1.19.1"
  chart      = "argo-cd"

  create_namespace = true 
  namespace = "argo-cd"
}
