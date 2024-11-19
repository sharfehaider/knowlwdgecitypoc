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


## Initialize Terraform
Run the following command to initialize Terraform:

```bash
 terraform init
```
## Plan the Infrastructure
Preview the changes Terraform will make:

```bash
 terraform plan
```
## Apply the Changes
Deploy the infrastructure:

```bash
 terraform apply
```



## Using the CI/CD Pipeline
The pipeline is defined in the .gitlab-ci.yml file and automates provisioning and deployment processes.

Pipeline Stages
```bash
1. init: Initializes Terraform for both primary and failover regions.
2. plan: Plans the infrastructure changes for both regions.
3. apply: Deploys the infrastructure in both regions.
4. build: Builds the React and Svelte front-end applications.
5. deploy: Deploys front-end, back-end, and microservices.
6. failover_sync: Synchronizes resources (e.g., S3 buckets, RDS replicas) between primary and failover regions.
7. rollback: Reverts changes if deployment fails.
```
Setting Up GitLab CI/CD
Add the following environment variables to GitLab CI/CD settings:

```bash
Copy code
AWS_ACCESS_KEY_ID=your-access-key-id
AWS_SECRET_ACCESS_KEY=your-secret-access-key
AWS_REGION_PRIMARY=us-east-1
AWS_REGION_FAILOVER=us-west-2
```
Push changes to the repository to trigger the pipeline:

```bash
Copy code
git add .
git commit -m "Trigger pipeline"
git push origin main
```
Monitor the pipeline execution in the GitLab UI under CI/CD > Pipelines.



Using Terraform
Install Terraform
Download and install Terraform from the official site.

Set AWS Credentials
Configure AWS credentials using the CLI or environment variables:

bash
Copy code
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
Initialize Terraform
Run the following command to initialize Terraform:

bash
Copy code
terraform init
Plan the Infrastructure
Preview the changes Terraform will make:

bash
Copy code
terraform plan
Apply the Changes
Deploy the infrastructure:

bash
Copy code
terraform apply
Using the CI/CD Pipeline
The pipeline is defined in the .gitlab-ci.yml file and automates provisioning and deployment processes.

Pipeline Stages
The pipeline includes the following stages:

init: Initializes Terraform for both primary and failover regions.
plan: Plans the infrastructure changes for both regions.
apply: Deploys the infrastructure in both regions.
build: Builds the React and Svelte front-end applications.
deploy: Deploys front-end, back-end, and microservices.
failover_sync: Synchronizes resources (e.g., S3 buckets, RDS replicas) between primary and failover regions.
rollback: Reverts changes if deployment fails.
Set Up GitLab CI/CD
Add the following environment variables to GitLab CI/CD settings:

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION_PRIMARY (e.g., us-east-1)
AWS_REGION_FAILOVER (e.g., us-west-2)
Push changes to the repository to trigger the pipeline:

bash
Copy code
git add .
git commit -m "Trigger pipeline"
git push origin main
Monitor the pipeline execution in the GitLab UI under CI/CD > Pipelines.