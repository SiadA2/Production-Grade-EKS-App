# Production-grade K8s deployment

<div align="center">
    <img src="./images/Screenshot 2025-12-06 113837.png" alt="Diagram" width="600"/>
</div>


## Overview

This project is is a scalable, production-grade deployment of the 2048 app, on an EKS cluster. The deployment is spread across three AZs, for high-availability and uses the EKS Managed Node Group service, allowing for streamlined scalability. Infrastructure deployments are automated using Terraform, and the application is containerised using Docker and deployed to a private container registry on AWS.

## Archetecture

<div align="center">
    <img src="./images/Screenshot 2025-12-06 085911.png" alt="Diagram" width="600"/>
</div>


## Key features

- **External-dns:** Automatically updates DNS records in Route 53.
- **Cert-manager:** Provides DNS validation and digital certificates, as well as certificate management.
- **Helm:** Orchestrates K8s deployments 
- **Prometheus/Grafana:** Fetches vital cluster logs/metrics and visualises them in readable dashboards.
- **Open ID Connect (OIDC):** Use of JSON web tokens over access keys lifts the risks & responsilities of key management and also enforces just-in-time permissions.  

## Directory Structure

```bash 

├── README.md
├── deployment/
│   ├── apps
│   │   └── /
│   ├── argo
│   │   └── /
│   ├── cert-mgr
│   │   └── /
│   ├── helm-values
│   │   └── /
│   ├── helmfile.yaml
│   ├── eks.tf
│   ├── locals.tf
│   ├── pod-identities.tf
│   ├── provider.tf
│   └── vpc.tf
└── src/
    └── Dockerfile

```

## Docker

<div align="center">
    <img src="./images/Screenshot 2025-11-22 170226.png" alt="Diagram" width="600"/>
</div>

- **Multistage builds:** Seperates the application build from the final image, cutting image sizes by **90%**
- **Image tagging:** Clear, readable tags allow us to easily and reliably rollback to known, stable versions
- **Dockerignore:**


## GitOps Workflow 

<div align="center">
    <img src="./images/Screenshot 2025-12-06 092242.png" alt="Diagram" width="600"/>
</div>

## ArgoCD

<div align="center">
    <img src="./images/Screenshot 2025-12-01 101134.png" alt="Diagram" width="600"/>
</div>

## Observability

### Prometheus: 

<div align="center">
    <img src="./images/Screenshot 2025-12-05 214311.png" alt="Diagram" width="600"/>
</div>

### Grafana: 

<div align="center">
    <img src="./images/Screenshot 2025-12-05 213920.png" alt="Diagram" width="600"/>
</div>

## Run Locally:

Copy the contents of ```src/``` into your local machine. Then run:

```bash 
python -m http.server 3000
```