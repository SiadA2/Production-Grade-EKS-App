# Cert-Manager Pod Identity

module "cert_manager_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "cert-manager"

  attach_cert_manager_policy    = true
  cert_manager_hosted_zone_arns = ["arn:aws:route53:::hostedzone/Z02432831FEC57GRQFGHB"]

  associations = {
    this = {
      cluster_name    = local.name
      namespace       = "cert-manager"
      service_account = "cert-manager"
    }
  }

  tags = local.tags
}

# ExternalDNS Pod Identity

module "external_dns_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "external-dns"

  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = ["arn:aws:route53:::hostedzone/Z02432831FEC57GRQFGHB"]

  associations = {
    this = {
      cluster_name    = local.name
      namespace       = "external-dns"
      service_account = "external-dns-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}