﻿# Terraform-Project

# Terraform AWS EC2 Setup Project

This project provisions an AWS EC2 instance, configures it, and automates deployment using Terraform and Jenkins. It includes shell scripts for instance setup and automation tasks.

## Table of Contents

- [Project Overview](#project-overview)
- [Files and Purpose](#files-and-purpose)
  - [instance.tf](#1-instancetf)
  - [Jenkinsfile](#2-jenkinsfile)
  - [script.sh](#3-scriptsh)
  - [script1.sh](#4-script1sh)
  - [variables.tf](#5-variablestf)
- [Prerequisites](#prerequisites)
- [Usage](#usage)

---

## Project Overview

This project uses Terraform to provision an EC2 instance in AWS and configures automated tasks with Jenkins. The setup ensures that the instance is deployed with necessary configurations and scripts.

## Files and Purpose

### 1. `instance.tf`

The Terraform configuration for creating an EC2 instance. Key configurations:

- **AMI**: Specifies the Amazon Machine Image ID.
- **Instance Type**: Defines the EC2 instance type (e.g., `t2.micro`).
- **Key Pair**: Sets up the SSH key for access.
- **Security Groups**: Adds network security rules.
- **User Data**: Initializes the instance with predefined scripts.

### 2. `Jenkinsfile`

Defines a CI/CD pipeline for automating deployments and tasks on the EC2 instance. Key stages:

- **Build Stage**: Initializes Terraform and checks syntax.
- **Deploy Stage**: Applies Terraform configurations.
- **Test Stage**: Verifies instance configurations.

### 3. `script.sh`

This script configures the EC2 instance after launch. Tasks may include:

- **Installing software** (e.g., Nginx, Apache).
- **Setting environment variables**.
- **Configuring firewall rules** and permissions.

### 4. `script1.sh`

Handles additional configuration tasks, like:

- **Applying security updates**.
- **Setting up logging** or monitoring.
- **Scheduling maintenance jobs**.

### 5. `variables.tf`

Defines variables for Terraform configurations. Key variables include:

- **Region**: AWS region for the instance.
- **Instance Type**: EC2 instance size.
- **AMI ID**: Default AMI for the instance.
- **Key Name**: SSH key to use.

## Prerequisites

- **Terraform**: Installed and configured.
- **AWS CLI**: Configured with valid credentials.
- **Jenkins**: An active Jenkins server.

## Usage

1. **Initialize Terraform**:
   Initialize your Terraform environment to prepare for the deployment:
   ```bash
   terraform init
2. **Preview Changes**:
   Run terraform plan to review and confirm changes to be applied based on the configuration:
   ```bash
   terraform plan
3. **Apply Configuration**:
   Apply the configuration to create the EC2 instance as defined in instance.tf:
   ```bash
   terraform apply
4. Automated Deployment with Jenkins: Run the Jenkins pipeline to automatically provision or update the EC2 instance. Jenkins will handle Terraform execution and script deployment.

5. Run Shell Scripts:

### script.sh and script1.sh can be executed manually or triggered through Jenkins for additional post-deployment configuration tasks, such as software installation and security updates.

### This updated **Usage** section provides step-by-step guidance on using `terraform plan`, `terraform apply`, Jenkins automation, and shell script execution. Let me know if you'd like further adjustments!

