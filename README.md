# Infrastructure Deployment

This repository contains Terraform code and a GitLab CI/CD pipeline to deploy infrastructure across multiple AWS regions with failover and high availability.

---

## Prerequisites

- **Terraform**: Download and install from [Terraform Official Site](https://www.terraform.io/downloads.html).
- **AWS Credentials**: Set up AWS credentials with sufficient permissions to create VPCs, EC2, RDS, EKS, and other resources.

---

## Installation

### Using Terraform

1. **Install Terraform**
   Download and install Terraform from the [official site](https://www.terraform.io/downloads.html).

2. **Set AWS Credentials**
   Configure AWS credentials using the CLI or environment variables:

   ```bash
   export AWS_ACCESS_KEY_ID=your-access-key-id
   export AWS_SECRET_ACCESS_KEY=your-secret-access-key
