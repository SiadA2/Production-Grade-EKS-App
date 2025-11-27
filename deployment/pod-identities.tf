# Cert-Manager Pod Identity

module "cert_manager_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "cert-manager"

  attach_cert_manager_policy    = true
  cert_manager_hosted_zone_arns = ["arn:aws:route53:::hostedzone/Z02432831FEC57GRQFGHB"]

  tags = local.tags
}

resource "aws_eks_pod_identity_association" "cert-manager" {
  cluster_name    = module.eks.cluster_name
  namespace       = "cert-manager"
  service_account = "cert-manager"
  role_arn        = module.cert_manager_pod_identity.iam_role_arn 
}

# ExternalDNS Pod Identity

module "external_dns_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "external-dns"

  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = ["arn:aws:route53:::hostedzone/Z02432831FEC57GRQFGHB"]

  tags = local.tags
}

resource "aws_eks_pod_identity_association" "external-dns" {
  cluster_name    = module.eks.cluster_name
  namespace       = "external-dns"
  service_account = "external-dns"
  role_arn        = module.external_dns_pod_identity.iam_role_arn
}

