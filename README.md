# Production-Grade-EKS-Cluster

## Overview

This project is is a scalable, production-grade deployment of the 2048 app, on an EKS cluster. The deployment is spread across three AZs, for high-availability and uses the EKS Managed Node Group service, allowing for streamlined scalability. Infrastructure deployments are automated using Terraform, and the application is containerised using Docker and deployed to a private container registry on AWS.

## Archetecture

## Key features

- Real-time DNS updates through external-dns
- DNS validation and certificates provided through cert-manager
- CI/CD implemented through GitHub Actions(CI) and ArgoCD(CD)
- Open ID Connect(OIDC) configured into GitHub Actions pipelines, reducing the risk of long-lived credentials 
- Observability provided through Prometheus and Grafana

## Directory Structure

```bash 

├── README.md
├── deployment/
│   ├── apps/
│   │   └── game.yaml
│   ├── argo/
│   │   └── apps-argo.yaml
│   ├── cert-mgr/
│   │   └── issuer.yaml
│   ├── helm-values
│   │   └── /
│   ├── helmfile.yaml
│   ├── eks.tf
│   ├── locals.tf
│   ├── pod-identities.tf
│   ├── provider.tf
│   └── vpc.tf
├── images
└── src

```

## GitOps Workflow 