# Terraform Docker Demo

This project provisions a local Docker container using **Terraform** and the **kreuzwerker/docker** provider.

## Steps to Reproduce
1. Install Terraform and Docker
2. Run:
   ```bash
   terraform init
   terraform plan -out=tfplan
   terraform apply "tfplan"
