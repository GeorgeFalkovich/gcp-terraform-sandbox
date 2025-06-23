# GCP Production-Ready Terraform Architecture

This repository contains a basic, production-class Google Cloud Platform (GCP) architecture managed with Terraform. It is designed to provide a solid foundation for deploying scalable, secure, and maintainable cloud infrastructure for real-world projects.

**Note:** I use this repository to test my workloads on GCP before deploying them to customer production environments. This allows for validation, troubleshooting, and optimization in a safe, isolated setting.

## Features

- Modular Terraform code for reusability and clarity
- Google Kubernetes Engine (GKE) cluster with configurable options
- Cloud SQL instance with private networking
- Cloud NAT, VPC, firewall, and load balancer setup
- Service accounts and IAM configuration
- Helm chart example for custom workloads
- Example startup scripts for common services

## Structure

- `modules/` — Reusable Terraform modules (GKE, Cloud SQL, VM, Cloud NAT, etc.)
- `customnginx/` — Example Helm chart for Kubernetes
- `startup/` — Shell scripts for provisioning and configuration
- Root Terraform files for environment composition

## Usage

1. Clone this repository.
2. Configure your `terraform.tfvars` and credentials in `creds/key.json`.
3. Run `terraform init`, `terraform plan`, and `terraform apply` to deploy.

## Requirements

- Terraform
- GCP account and project
- Sufficient IAM permissions

## Notes

- This setup is intended as a starting point for production environments. Review and adapt security, networking, and resource settings to your needs.
- Contributions and improvements are welcome!

---

© 2025 Your Name. MIT License.
